Rails.application.routes.draw do
  get 'weather/dashboard'
  post 'weather/address'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "weather#dashboard"
end
