Rails.application.routes.draw do
  devise_for :users

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
root 'posts#index' # home page on localhost:3000
end