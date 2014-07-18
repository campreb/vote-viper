Rails.application.routes.draw do

  namespace :admin do
    resources :campaigns do
      resources :responders
    end
  end

  root to: "admin/campaigns#index"

  get "campaign" => "campaigns#show"

  devise_for :users
end
