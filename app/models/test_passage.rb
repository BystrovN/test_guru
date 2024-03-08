class TestPassage < ApplicationRecord
  SUCCESS_PERCENTAGE = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true, foreign_key: 'question_id'

  before_validation :before_validation_find_next_question
  before_save :set_passed

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def success_percentage
    (correct_questions.to_f / test.questions.count * 100).round(2)
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def total_questions
    test.questions.count
  end

  def success?
    passed
  end

  private

  def find_first_question
    self.current_question = test.questions.first if test.present?
  end

  def find_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_find_next_question
    if new_record?
      find_first_question
    else
      find_next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids
  end

  def correct_answers
    current_question.answers.correct
  end

  def set_passed
    self.passed = (correct_questions / test.questions.count) >= SUCCESS_PERCENTAGE.to_f / 100
  end
end
