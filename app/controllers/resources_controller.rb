class ResourcesController < ApplicationController
  layout 'admin'

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.order(:name).all
    @resource = Resource.new
    @categories = Category.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])
    @categories = Category.all

    if params[:commit] == "Edit"
      redirect_to edit_resource_path(@resource)
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @resource }
      end
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
    @categories = Category.all
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.js   {}
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.js   {}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.js   {}
      format.json { head :no_content }
    end
  end

private

  def resource_params
    params[:resource] ||= {}
    permitted = params[:resource].permit(:name, :description, :link, :starting_weight, :category_id)
    permitted
  end

end
