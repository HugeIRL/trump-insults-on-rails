class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @tweets = Tweet.order(:date).page(params[:page]).per(10)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
end
