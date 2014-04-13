Rails.application.routes.draw do

  namespace :admin do
    resources :elections do
      resources :responders
    end
  end

  root to: "admin/elections#index"

  get "election" => "elections#show"

  devise_for :users
end
