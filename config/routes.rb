# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    resources :notes
  end
end
