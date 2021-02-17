class SearchController < ApplicationController
  def search
    if params[:search].blank?
      redirect_to(root_path) and return
    else
      @parameter = params[:search].downcase
      @results = Insult.all.where("lower(text) LIKE :search", search: "%#{@parameter}%")
    end
  end
end
