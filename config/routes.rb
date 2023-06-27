Rails.application.routes.draw do
  # get 'pathologies/index'
  # get 'pathologies/show'
  # get 'pathologies/new'
  # get 'pathologies/edit'

  # get 'follow_ups/index'
  # get 'follow_ups/show'
  # get 'follow_ups/new'
  # get 'follow_ups/edit'

  # get 'user/email'
  # get 'user/password'
  # get 'user/pofilepic'
  # get 'user/first_name'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
resources :prescriptions do
  resources :follow_ups, only: %i[index show new create edit update]
  resources :measures, only: %i[show new create]
  end
  resources :follow_ups, only: %i[edit update destroy]
  resources :measures, only: %i[edit update destroy]

  resources :pathologies, only: %i[index show edit update new create]
  # get "dashboard", to: "pages#dashboard"

end
