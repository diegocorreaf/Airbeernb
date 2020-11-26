Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'purchase/create'
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: %i[index show new create edit update]
  resources :products, shallow: true do
    resources :purchases, only: %i[create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
