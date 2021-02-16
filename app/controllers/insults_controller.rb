class InsultsController < ApplicationController
  def index
    @insults = Insult.all
  end

  def show
    @insult = Insult.find(params[:id])
  end
end
