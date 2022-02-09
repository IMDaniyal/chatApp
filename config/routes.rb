Rails.application.routes.draw do
  get 'notifications/index', as: 'notifications'
  get '/notification/:id/:room_id', to: 'notifications#mark_read', as: 'mark_notification_read'
  resources :rooms do
    resources :messages
  end
  get 'main/index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  get '/users/:id', to: 'users#show', as: 'user'
  root 'main#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
