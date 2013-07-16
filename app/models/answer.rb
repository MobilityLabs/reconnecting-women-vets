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
      q = nil
      # If we want to stay on the current pathway (i.e. my goto_pathway is my pathway),
      # find the next question on the pathway
      if goto_pathway.id == question.pathway_id
        # find my index
        ix = goto_pathway.questions.find_index question
        # and return the next question on the pathway (if it exists)
        q = goto_pathway.questions.at(ix+1) if ix
      else
        # otherwise, go to the first question of the goto pathway
        q = goto_pathway.questions.first
      end
      return q if q
    else
      # there's no goto_pathway (it's not present? i.e. null),
      # so process a return to the previous pathway,
      # based on the path that led to this question
      path_taken.reverse.each do |answer_id|
        begin
          answer = Answer.find(answer_id)
          return answer.next_question if answer.question.pathway_id != question.pathway_id
        rescue ActiveRecord::RecordNotFound
          Rails.logger.error "Answer not found for id# #{answer_id}"
        end
      end
    end
    Rails.logger.error "Next answer not found for id# #{id}"
    nil
  end

end
