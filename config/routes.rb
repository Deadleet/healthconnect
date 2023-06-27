Rails.application.routes.draw do
  # get 'user/email'
  # get 'user/password'
  # get 'user/pofilepic'
  # get 'user/first_name'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
resources :prescriptions do
  resources :follow_ups, only: %i[show new create]
  resources :measures, only: %i[show new create]
  end
  resources :follow_ups, only: %i[edit update destroy]
  resources :measures, only: %i[edit update destroy]

  # get "dashboard", to: "pages#dashboard"

end
