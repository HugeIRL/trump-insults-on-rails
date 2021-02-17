class InsultsController < ApplicationController
  def index
    @insults = Insult.page(params[:page]).per(21)
  end

  def show
    @insult = Insult.find(params[:id])
  end
end
