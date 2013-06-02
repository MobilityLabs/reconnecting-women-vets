class Pathway < ActiveRecord::Base

  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  after_update :save_questions

  def new_question_attributes=(question_attributes)
    question_attributes.each do |attributes|
      questions.build(attributes)
    end
  end

  def existing_question_attributes=(question_attributes)
    question.reject(&:new_record?).each do |question|
      attributes = question_attributes[question.id.to_s]
      if attributes['_delete'] == '1'
        question.delete(task)
      else
        question.attributes = attributes
      end
    end
  end

  private

    def save_questions
      questions.each do |question|
        question.save(false)
      end
    end

  validates_associated :questions
end
