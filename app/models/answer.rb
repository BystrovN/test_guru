class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_number_of_answers, on: :create

  scope :correct_answers, -> { where(correct: true) }

  private

  def validate_number_of_answers
    errors.add(:base, 'Допустимое число ответов - от 1 до 4') unless question.answers.length.between?(0, 4)
  end
end
