# frozen_string_literal: true

Rails.application.routes.draw do  
  root "landing_page#home"
  #get "products#index"
  devise_for :users

  namespace :admin do
    root "application#index"
    resources :products, only: [:new, :create, :destroy]
    resources :users
  end  

  resources :products do
    resources :notes
  end  
end
