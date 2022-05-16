Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places do
    resources :guides, only: [:new, :create, :edit]
    resources :reviews, only: :create
  end

  resources :reviews, only: :destroy

  resources :guides, only: [:index, :destroy, :show, :update]
end
