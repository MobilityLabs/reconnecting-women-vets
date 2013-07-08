class PathwaysController < ApplicationController
  layout 'admin'

  # GET /pathways
  # GET /pathways.json
  def index

    begin
      @pathways = Pathway.order(:name).to_a

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @pathways }
      end
    rescue
      handle_unspecified_error
    end

  end

  # GET /pathways/1
  # GET /pathways/1.json
  def show

    begin
      @pathway = Pathway.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @pathway }
      end
    rescue ActiveRecord::RecordNotFound
      handle_pathway_not_found
    end

  end

  # GET /pathways/new
  # GET /pathways/new.json
  def new
    begin
      @pathway = Pathway.new
      @pathways = Pathway.all.collect{ |rc| [rc.name, rc.id]}
      @resources = Resource.all.collect{ |rc| [rc.name, rc.id]}
    rescue
      handle_unspecified_error
    end
  end

  # GET /pathways/1/edit
  def edit
    begin
      @pathway = Pathway.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      handle_pathway_not_found
    end
  end

  # POST /pathways
  # POST /pathways.json
  def create
    begin
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
    rescue
      handle_unspecified_error
    end
  end

  # PUT /pathways/1
  # PUT /pathways/1.json
  def update

    begin
      @pathway = Pathway.includes(:questions).find(params[:id])

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

    rescue ActiveRecord::RecordNotFound
      handle_pathway_not_found
    end

  end

  # DELETE /pathways/1
  # DELETE /pathways/1.json
  def destroy

    begin
      @pathway = Pathway.find(params[:id])

      @pathway.destroy

      respond_to do |format|
        format.html { redirect_to pathways_url, notice: 'Pathway was successfully deleted.' }
        format.js   {}
        format.json { head :no_content }
      end

    rescue ActiveRecord::RecordNotFound
      handle_pathway_not_found
    end

  end

  # GET /pathways/1/questions
  def questions

    begin
      @pathway = Pathway.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      handle_pathway_not_found
    end

  end

private

  def pathway_params
    params.require(:pathway).permit(:name,
                                    :questions_order,
                                    questions_attributes: [
                                      :id,
                                      :text,
                                      :pathway_id,
                                      :order,
                                      :_destroy,
                                      answers_attributes: [
                                        :id,
                                        :text,
                                        :reassurance,
                                        :question_id,
                                        :resource_id,
                                        :pathway_id,
                                        :_destroy ]
                                      ]
                                    )
  end

  def handle_pathway_not_found
    redirect_to pathways_path, alert: 'Pathway was not found.'
  end

  def handle_unspecified_error
    Rails.logger.error "ERROR: #{$!}"
    redirect_to root_path, alert: 'Something horrible has happened.'
  end

end
