class ActionsController < ApplicationController

  def index
    @pathways = Pathway.all
  end

  def show
    @action = Action.find(params[:id])
  end

  def edit
    @action = Action.find(params[:id])
    @pathways = Pathway.order(:name)
  end

end
