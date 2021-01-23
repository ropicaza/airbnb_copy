Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats, only: [ :index, :show, :create, :new ] do
    resources :bookings, only: [ :new, :create ]
  end
end
