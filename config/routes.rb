Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Users could signup multiple times
  resources :users

  # Users can only make one session
  resource :session



  get "about", to: "page#about" 

  # Defines the root path route ("/")
  root "pages#home"
end
