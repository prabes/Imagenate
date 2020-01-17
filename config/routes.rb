# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers:
         { omniauth_callbacks: 'omniauth_callbacks',
           registrations: 'my_devise/registrations',
           confirmations: 'confirmations' }

  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
  root to: 'post#index'

  resources :profiles, except: [:index]

  resources :post, except: [:index] do
    resources :comments, except: [:index]
    resources :likes
  end
  resources :comments do
    resources :comments
  end

  post 'relationships', to: 'relationships#create'
  post 'relationship',  to: 'relationships#destroy'

  post 'requests', to: 'requests#create'
  post 'request', to: 'requests#destroy'

  get '/search' => 'search#create', :as => 'search_user'
end
