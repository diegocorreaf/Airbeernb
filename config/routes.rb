Rails.application.routes.draw do
  get 'purchase/create'
  devise_for :users
  root to: 'products#index'

  resources :profiles, only: %i[index show new create edit update]
  resources :products, shallow: true do
    resources :purchases, only: %i[create]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
