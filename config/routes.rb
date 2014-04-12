Rails.application.routes.draw do
  namespace :admin do
    resources :elections
  end

  root to: "admin/elections#index"

  get "election" => "elections#show"

  devise_for :users
end
