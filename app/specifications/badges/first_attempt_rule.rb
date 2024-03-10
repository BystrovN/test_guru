module Badges
  class FirstAttemptRule < BaseRuleSpecification
    def satisfied?
      @user.test_passages.where(test_id: @test_passage.test_id).count == 1
    end
  end
end
