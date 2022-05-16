Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places do
    resources :guides, only: [:new, :create]
    resources :reviews, only: :create
  end

  resources :reviews, only: :destroy

  resources :guides, only: [:index, :destroy, :show, :edit, :update] do
    resources :review_guides, only: :create
  end

  resources :review_guides, only: :destroy
end
