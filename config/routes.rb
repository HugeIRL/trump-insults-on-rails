Rails.application.routes.draw do
  resources :tweets, only: %i[index show]

  root to: "tweets#index"
end
