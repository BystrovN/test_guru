class BadgeRule < ApplicationRecord
  module RuleTypes
    CATEGORY_COMPLETION = 'category_completion'.freeze
    FIRST_ATTEMPT = 'first_attempt'.freeze
    LEVEL_COMPLETION = 'level_completion'.freeze
  end

  include RuleTypes

  belongs_to :badge

  enum rule_type: {
    CATEGORY_COMPLETION => 0,
    FIRST_ATTEMPT => 1,
    LEVEL_COMPLETION => 2
  }

  before_save :set_description

  validate :validate_category_condition, on: :create

  private

  def set_description
    self.description = case rule_type
                       when CATEGORY_COMPLETION
                         "Пройти все тесты категории #{Category.find(condition).title}"
                       when FIRST_ATTEMPT
                         'Пройти тест с первого раза'
                       when LEVEL_COMPLETION
                         "Пройти все тесты уровня #{condition}"
                       end
  end

  def validate_category_condition
    return unless rule_type == CATEGORY_COMPLETION && !Category.exists?(id: condition)

    errors.add(:condition, :miss_category)
  end
end
