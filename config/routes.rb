Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :posts, only: [:index, :new, :create, :show, :edit]
  get '/category/:id', to: 'posts#index', as: 'category_image'
end
