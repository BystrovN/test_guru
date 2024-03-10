module Badges
  class CategoryCompletionRule < BaseRuleSpecification
    def satisfied?
      multiplier = badge_multiplier
      all_category_test_ids = Test.where(category: @badge.condition).ids
      check_tests_completion(multiplier, all_category_test_ids)
    end
  end
end
