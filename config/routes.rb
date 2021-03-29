# frozen_string_literal: true

Rails.application.routes.draw do  
  root "products#index"
  devise_for :users

  namespace :admin do
    root "application#index"
    resources :products, only: [:new, :create, :destroy]
  end  

  resources :products do
    resources :notes
  end  
end
