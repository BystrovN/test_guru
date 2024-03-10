class BaseRuleSpecification
  def initialize(test_passage, badge)
    @test_passage = test_passage
    @badge = badge
    @user = test_passage.user
  end

  def satisfied?
    raise "#{__method__} undefined for class #{self.class}"
  end

  private

  def count_badges_for_user
    @user.badges.where(id: @badge.id).count
  end

  def badge_multiplier
    count_badges_for_user + 1
  end

  def successful_test_passages(test_ids)
    @user.test_passages.where(passed: true, test_id: test_ids)
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
