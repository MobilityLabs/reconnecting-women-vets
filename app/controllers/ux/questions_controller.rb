class Ux::QuestionsController < ApplicationController
  skip_before_filter :authenticate_admin!

  def show
    @question = Question.includes(:answers, :pathway).find(params[:id])
    @path_taken = path_taken

    begin
      @reassurance = Answer.find(@path_taken.last).reassurance if @path_taken.last.present?
    rescue ActiveRecord::RecordNotFound
      Rails.logger.info "Answer not found for id# #{@path_taken.last}"
      Rails.logger.info "Request: #{request.original_url}"
    end

    @resources = Resource.find_for @path_taken
  end

  def final
    @path_taken = path_taken
    @resources = Resource.find_for @path_taken
  end

private

  def path_taken
    @p ||= (request.query_parameters[:p] || '').split ','
  end

end
