class PathwaysController < ApplicationController
  layout 'admin'

  # GET /pathways
  # GET /pathways.json
  def index
    @pathways = Pathway.order(:name).to_a
    @pathway = Pathway.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pathways }
    end
  end

  # GET /pathways/1
  # GET /pathways/1.json
  def show
    @pathway = Pathway.find(params[:id])
    @pathways = Pathway.order(:name)
    @questions = Question.where(pathway_id: @pathway.id).order(:order)
    @question = Question.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pathway }
    end
  end

  # GET /pathways/new
  # GET /pathways/new.json
  def new
    @pathway = Pathway.new
    @pathways = Pathway.all.collect{ |rc| [rc.name, rc.id]}
    @resources = Resource.all.collect{ |rc| [rc.name, rc.id]}
  end

  # GET /pathways/1/edit
  def edit
    @pathway = Pathway.find(params[:id])
  end

  # POST /pathways
  # POST /pathways.json
  def create
    @pathway = Pathway.new(pathway_params)
    respond_to do |format|
      if @pathway.save
        format.html { redirect_to @pathway, notice: 'Pathway was successfully created.' }
        format.js   {}
        format.json { render json: @pathway, status: :created, location: @pathway }
      else
        format.html { render action: "new" }
        format.js   {}
        format.json { render json: @pathway.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pathways/1
  # PUT /pathways/1.json
  def update
    @pathway = Pathway.find(params[:id])

    respond_to do |format|
      if @pathway.update_attributes(pathway_params)
        format.html { redirect_to @pathway, notice: 'Pathway was successfully updated.' }
        format.js   {}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.js   {}
        format.json { render json: @pathway.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pathways/1
  # DELETE /pathways/1.json
  def destroy
    @pathway = Pathway.find(params[:id])
    @pathway.destroy

    respond_to do |format|
      format.html { redirect_to pathways_url }
      format.js   {}
      format.json { head :no_content }
    end
  end

  private
    def pathway_params
      params.require(:pathway).permit(:name,
                                      questions_attributes: [
                                        :id,
                                        :text,
                                        :pathway_id,
                                        :order,
                                        :_destroy,
                                        actions_attributes: [
                                          :id,
                                          :text,
                                          :question_id,
                                          :resource_id,
                                          :pathway_id,
                                          :_destroy ]
                                        ]
                                      )
    end
end
