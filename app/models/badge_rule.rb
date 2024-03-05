class BadgeRule < ApplicationRecord
  include RuleTypes

  belongs_to :badge

  enum type_: {
    CATEGORY_COMPLETION => 0,
    FIRST_ATTEMPT => 1,
    LEVEL_COMPLETION => 2
  }
end
