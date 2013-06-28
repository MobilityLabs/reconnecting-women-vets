class Ux::QuestionsController < ApplicationController
  skip_before_filter :authenticate_admin!

  def show
    @question = Question.includes(:answers, :pathway).find(params[:id])
    @query = request.query_parameters
    @query[:p] ||= ''

    @reassurance = Answer.find(@query[:a]).reassurance if @query[:a].present?

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
