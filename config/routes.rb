Rails.application.routes.draw do
  resources :followships
  devise_for :users
  
  get 'comments/index'
  get 'comments/show'
  get 'comments/new'
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'


  get 'posts/index'
  get 'posts/create'
  get 'posts/new'
  get 'posts/destroy'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :posts
  end

  resources :posts do 
    resources :comments
  end

  resources :tags
root 'posts#index' # home page on localhost:3000
end