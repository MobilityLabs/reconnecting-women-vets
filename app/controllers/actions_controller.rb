class ActionsController < ApplicationController

  layout 'admin'

  def index
    @pathways = Pathway.all
  end

  def show
    @action = Action.find(params[:id])
  end

  def edit
    @action = Action.find(params[:id])
    @pathways = Pathway.order(:name)
    @resources = Resource.all
  end

  def update
    @action = Action.find(params[:id])

    respond_to do |format|
      if @action.update_attributes(action_params)
        format.html { redirect_to @action, notice: 'Action was successfully updated.' }
        format.js   {}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @action.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def action_params
    Rails.logger.debug "DEBUG: params          = #{params.inspect}"
    Rails.logger.debug "DEBUG: params[:action] = #{params[:action].inspect}"
    params[:action] ||= {}
    params[:action].permit(:text, :pathway_id, :resource_ids)
  end

end
