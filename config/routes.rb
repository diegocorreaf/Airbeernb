Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: %i[new create]
  resources :products do
    resources :purchase, only: %i[create]
  end
  resources :purchases, only: :show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
