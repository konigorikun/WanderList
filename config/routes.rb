Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :posts do
    resources :comments, only: :create
  end
  get '/category/:id', to: 'posts#index', as: 'category_image'
  resources :schedules, only: [:index, :new, :create]
end
