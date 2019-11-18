# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
      

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'post#index'
  
  resources :profiles, except: [:index]
  
  resources :post, except: [:index] do
    resources :comments, except: [:index]
    resources :likes
  end

  post 'relationships', to: 'relationships#create'
  post 'relationship',  to: 'relationships#destroy'
end
