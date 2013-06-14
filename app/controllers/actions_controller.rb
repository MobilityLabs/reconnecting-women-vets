class ActionsController < ApplicationController

  def show
    @action = Action.find(params[:id])
  end

  def edit
    @action = Action.find(params[:id])
    @pathways = Pathway.order(:name)
  end

end
