class Badge < ApplicationRecord
  include RuleTypesHelper

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  validates :name, :image_url, :description, :rule_type, presence: true

  enum rule_type: {
    CATEGORY_COMPLETION => 0,
    FIRST_ATTEMPT => 1,
    LEVEL_COMPLETION => 2
  }
end
