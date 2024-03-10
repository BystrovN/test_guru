class BadgeService
  include RuleTypesHelper

  RULE_CLASSES = {
    CATEGORY_COMPLETION => Badges::CategoryCompletionRule,
    FIRST_ATTEMPT => Badges::FirstAttemptRule,
    LEVEL_COMPLETION => Badges::LevelCompletionRule
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @badges_to_issue = []
  end

  def check_and_issue_badges
    Badge.find_each do |badge|
      next unless RULE_CLASSES.key?(badge.rule_type)

      @badges_to_issue << badge if RULE_CLASSES[badge.rule_type].new(@test_passage, badge).satisfied?
    end

    issue_badges
  end

  private

  def issue_badges
    @test_passage.user.badges << @badges_to_issue
  end
end
