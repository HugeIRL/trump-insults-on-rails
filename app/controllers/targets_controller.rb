class TargetsController < ApplicationController
  def index
    @targets = Target.page(params[:page]).per(10)
  end

  def show
    @target = Target.find(params[:id])
  end
end
