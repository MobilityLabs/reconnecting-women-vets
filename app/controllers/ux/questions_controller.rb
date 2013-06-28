class Ux::QuestionsController < ApplicationController
  skip_before_filter :authenticate_admin!

  def show
    @question = Question.includes(:answers, :pathway).find(params[:id])
    @query = request.query_parameters
    @query[:p] ||= ''

    answers = @query[:p].split ','

    @reassurance = Answer.find(answers.first).reassurance if answers.first.present?

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
