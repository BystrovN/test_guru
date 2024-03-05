class BadgeService
  include RuleTypes

  RULE_METHODS = {
    CATEGORY_COMPLETION => :check_category_completion,
    FIRST_ATTEMPT => :check_first_attempt,
    LEVEL_COMPLETION => :check_level_completion
  }.freeze

  def self.check_and_issue_badges(test_passage)
    BadgeRule.all.each do |rule|
      next unless RULE_METHODS.key?(rule.type_)

      send(RULE_METHODS[rule.type_], test_passage, rule)
    end
  end

  def self.check_category_completion(test_passage, rule)
    user_test_ids = test_passage.user.tests.where(category: rule.condition).pluck(:test_id)
    return unless user_test_ids.uniq.length == Test.where(category: rule.condition).count

    issue_badge(test_passage.user, rule.badge)
  end

  def self.check_first_attempt(test_passage, rule)
    issue_badge(test_passage.user, rule.badge) if test_passage.user.tests.where(id: test_passage.test.id).count == 1
  end

  def self.check_level_completion(test_passage, rule)
    user_test_ids = test_passage.user.tests.where(level: rule.condition).pluck(:test_id)
    return unless user_test_ids.uniq.length == Test.where(level: rule.condition).count

    issue_badge(test_passage.user, rule.badge)
  end

  def self.issue_badge(user, badge)
    user.badges << badge
  end
end
