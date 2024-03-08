class BadgeService
  include BadgeRule::RuleTypes

  RULE_METHODS = {
    CATEGORY_COMPLETION => :check_category_completion,
    FIRST_ATTEMPT => :check_first_attempt,
    LEVEL_COMPLETION => :check_level_completion
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @badges_to_issue = []
  end

  def check_and_issue_badges
    BadgeRule.find_each do |rule|
      next unless RULE_METHODS.key?(rule.rule_type)

      @badges_to_issue << rule.badge if send(RULE_METHODS[rule.rule_type], rule)
    end

    issue_badges
  end

  private

  def check_category_completion(rule)
    multiplier = badge_multiplier(rule.badge)
    all_category_test_ids = Test.where(category: rule.condition).ids
    check_tests_completion(multiplier, all_category_test_ids)
  end

  def check_first_attempt(_)
    @user.test_passages.where(test_id: @test_passage.test_id).count == 1
  end

  def check_level_completion(rule)
    multiplier = badge_multiplier(rule.badge)
    all_level_test_ids = Test.where(level: rule.condition).ids
    check_tests_completion(multiplier, all_level_test_ids)
  end

  def issue_badges
    @user.badges << @badges_to_issue
  end

  def successful_test_passages(test_ids)
    @user.test_passages.where(passed: true, test_id: test_ids)
  end

  def count_badges_for_user(badge)
    @user.badges.where(id: badge.id).count
  end

  def badge_multiplier(badge)
    count_badges_for_user(badge) + 1
  end

  def filter_test_ids_by_badge_count(multiplier, test_ids)
    counts = Hash.new(0)
    test_ids.each { |element| counts[element] += 1 }
    test_ids.select! { |element| counts[element] >= multiplier }
    test_ids.uniq
  end

  def check_tests_completion(badge_multiplier, tests_id)
    successful_test_ids = successful_test_passages(tests_id).pluck(:test_id)
    test_ids_with_multiplier = filter_test_ids_by_badge_count(badge_multiplier, successful_test_ids)
    test_ids_with_multiplier.count == tests_id.count
  end
end
