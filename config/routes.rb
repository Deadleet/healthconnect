Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
resources :prescriptions do
  resources :follow_ups, only: %i[index show new create edit update]
  resources :measures, only: %i[show new create] do
    resources :measurements, only: %i[index show new create edit update]
    end
  end
  resources :follow_ups, only: %i[edit update destroy]
  resources :measures, only: %i[edit update destroy]

  resources :pathologies, only: %i[index show edit update new create]
  # get "dashboard", to: "pages#dashboard"
end
