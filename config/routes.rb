Rails.application.routes.draw do
  get 'post/new'
  get 'post/create'
  get 'post/index'
  get 'post/edit'
  get 'post/update'
  get 'post/destroy'
  get 'post/new'
  get 'post/create'
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'post#index'

   
end
