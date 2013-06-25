class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :goto_pathway, foreign_key: :pathway_id, class_name: 'Pathway'
  has_and_belongs_to_many :resources

  def next_question
    @next_question ||= lookup_next_question
  end

private

  def lookup_next_question
    if goto_pathway.present?
      goto_pathway.questions.first
    else
      question.pathway.questions.where('`order` > ?', question.order).first
    end
  end

end
