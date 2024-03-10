module Badges
  class LevelCompletionRule < BaseRuleSpecification
    def satisfied?
      multiplier = badge_multiplier
      all_level_test_ids = Test.where(level: @badge.condition).ids
      check_tests_completion(multiplier, all_level_test_ids)
    end
  end
end
