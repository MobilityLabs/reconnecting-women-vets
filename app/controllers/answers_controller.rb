class AnswersController < ApplicationController
  layout 'admin'

  def index
    @pathways = Pathway.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
    @pathways = Pathway.order(:name)
    @resources = Resource.all
  end

  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.js   {}
        format.json { head :no_content }
      else
        format.html { render answer: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def answer_params
    res = params[:answer].permit(:text, :pathway_id, resource_ids: [])
    Rails.logger.debug "DEBUG: permitted params = #{res.inspect}"
    res
  end

end
