class User < ApplicationRecord
  has_secure_password

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def tests_by_level(level)
    tests.where(level:)
  end
end
