Rails.application.routes.draw do

  namespace :admin do
    resources :campaigns do
      post :notify_responders, on: :member

      resources :responders do
        post :import, on: :collection
        post :send_notification, on: :member
      end
    end
  end

  root to: "admin/campaigns#index"

  get "campaign" => "campaigns#show"

  devise_for :users
end
