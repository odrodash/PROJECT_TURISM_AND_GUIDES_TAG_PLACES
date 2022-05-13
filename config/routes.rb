Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places, only: [:index, :new, :create, :show] do
    resources :guides, only: [:new, :create]
    resources :reviews, only: :create
  end

  resources :guides, only: [:index, :destroy, :show]
end
