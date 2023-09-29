Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'dashboard', to: 'dashboard#index'

  resources :products do
    member do
      post :toggle_published
    end
  end
end
