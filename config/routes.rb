Rails.application.routes.draw do
  get '/search' => 'search#search', :as => 'search_page'
  resources :tweets, only: %i[index show]
  resources :targets, only: %i[index show]
  resources :insults, only: %i[index show]

  root to: "tweets#index"
end
