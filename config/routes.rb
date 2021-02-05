Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats, only: [ :index, :show, :create, :new, :update, :edit, :destroy ] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [ :index, :destroy, :update] do
    resources :reviews, only: [ :new, :create ]
  end
end
