class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(date: :desc).page(params[:page]).per(5)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
end
