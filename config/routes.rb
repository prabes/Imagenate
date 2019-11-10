# frozen_string_literal: true

Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'post#index'

  resources :post, except: [:index]
  resources :comments
  resources :profiles, except: [:index]
end

