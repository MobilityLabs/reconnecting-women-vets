class AnswersController < ApplicationController
  layout 'admin'

  def index
    @answers = Answer.all
  end

  def new
    redirect_to pathways_path
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
    @pathways = Pathway.order(:name).to_a
    @resources = Resource.order(:name).to_a
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
    params[:answer].permit(:text, :reassurance,
                           :end_of_path, :pathway_id,
                           resource_ids: [])
  end

end
