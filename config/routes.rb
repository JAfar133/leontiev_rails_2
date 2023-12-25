Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :meetings do
    member do
      post 'join_to_meeting'
    end
  end

  resources :users, only: [] do
    get 'meetings', on: :member
  end

  root 'meetings#index'
  get "up" => "rails/health#show", as: :rails_health_check

end
