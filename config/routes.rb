Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'home/index'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :payments, only: [:create] do
    collection do
      get :promocode, as: :promocode
      post :confirm, as: :confirm
      post :enter_promo, as: :enter_promo
    end
  end
end
