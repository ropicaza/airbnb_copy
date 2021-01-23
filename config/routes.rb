Rails.application.routes.draw do
  get 'flats/index'
  get 'flats/show'
  get 'flats/create'
  get 'flats/new'
  devise_for :users
  root to: 'pages#home'
  resources :flats, only: [ :index, :show, :create, :new ] do
    resources :bookings, only: [ :create ]
  end
end
