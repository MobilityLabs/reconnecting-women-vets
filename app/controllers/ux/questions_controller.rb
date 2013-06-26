class Ux::QuestionsController < ApplicationController

  def show
    @question = Question.includes(:answers, :pathway).find(params[:id])
    @query = request.query_parameters
    @query[:p] ||= ''

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
