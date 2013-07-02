class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :goto_pathway, foreign_key: :pathway_id, class_name: 'Pathway'
  has_and_belongs_to_many :resources

  def next_question path_taken=[]
    # try to calculate the next question ONLY if the path taken is new
    @path_taken ||= path_taken
    if @path_taken == path_taken
      @next_question ||= lookup_next_question path_taken
    else
      @next_question = lookup_next_question path_taken
    end
  end

private

  def lookup_next_question path_taken
    if goto_pathway.present?
      goto_pathway.questions.first
    else
      # there's no goto_pathway (it's not present? i.e. null),
      # so process a return to the previous pathway,
      # based on the path that led to this question
      path_taken.reverse.each do |answer_id|
        begin
          answer = Answer.find(answer_id)
          if answer.question.pathway_id != self.question.pathway_id
            return Question.where(pathway_id: answer.question.pathway_id)
                           .where('`order` > ?', answer.question.order)
                           .order(:order).limit(1).first
          end
        rescue
          Rails.logger.info "Answer not found for id# #{answer_id}"
        end
      end
      nil
    end
  end

end
