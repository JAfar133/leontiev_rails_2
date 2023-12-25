Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :meetings
  root 'meetings#index'
  get "up" => "rails/health#show", as: :rails_health_check

end
