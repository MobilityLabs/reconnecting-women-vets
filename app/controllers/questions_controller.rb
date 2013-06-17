class QuestionsController < ApplicationController
  layout 'admin'

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.select('questions.*')
                         .joins(:pathway)
                         .order('pathways.name, questions.order')
                         .all
    @question = Question.new

    @pathways = Pathway.order(:name).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.includes(:answers).find(params[:id])
    @parent_pathway = Pathway.find(@question.pathway_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
    @pathways = Pathway.order(:name)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.includes(:answers).find(params[:id])
    @parent_pathway = Pathway.find(@question.pathway_id)
    @pathways = Pathway.order(:name)
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(permitted_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.js   {}
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.js   {}
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(permitted_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.js   {}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.js   {}
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.js   {}
      format.json { head :no_content }
    end
  end

private

  def permitted_params
    params[:question].permit(:text,
                             :order,
                             :pathway_id,
                             answers_attributes: [:text,
                                                  :id,
                                                  :pathway_id,
                                                  :_destroy])
  end

end
