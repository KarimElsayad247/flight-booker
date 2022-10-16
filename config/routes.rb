Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'flights#flights'

  get '/flights', to: 'flights#flights'

  resources :bookings, only: [:new, :create, :show]
end
