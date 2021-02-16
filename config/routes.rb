Rails.application.routes.draw do
  resources :tweets, only: %i[index show]
  resources :targets, only: %i[index show]

  root to: "tweets#index"
end
