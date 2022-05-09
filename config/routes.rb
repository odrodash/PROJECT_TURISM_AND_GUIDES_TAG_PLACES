Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places, only: [:index, :show, :new, :create] do
    resources :guides, only: [:show, :new, :create]
  end

  resources :guides, only: [:index, :destroy]
end
