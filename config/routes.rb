Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'dashboard', to: 'dashboard#index'

  resources :products do
    member do
      post :toggle_published
    end

    resources :contents, only: :index, controller: 'products/contents'
  end

  namespace :api do
    resources :contents, only: [:create, :update]
  end
end
