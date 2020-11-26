Rails.application.routes.draw do
  get 'purchase/create'
  devise_for :users
  root to: 'pages#home'

<<<<<<< HEAD
  resources :profiles, only: %i[new create edit update show]
=======
  resources :profiles, only: %i[index show new create edit update]
>>>>>>> 991efa8951ea4468285c1ef46cc43aa6b048f694
  resources :products, shallow: true do
    resources :purchases, only: %i[create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
