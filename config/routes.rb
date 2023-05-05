Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :posts
  get '/category/:id', to: 'posts#index', as: 'category_image'
end
