Rails.application.routes.draw do
  root to: "elections#index"
  resources :elections, only: [:show]

  devise_for :users
end
