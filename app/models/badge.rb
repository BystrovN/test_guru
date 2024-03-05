class Badge < ApplicationRecord
  has_many :badge_rules, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  validates :name, presence: true
  validates :image_url, presence: true
end
