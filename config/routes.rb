Rails.application.routes.draw do
  resources :categories
  resources :favorites
  resources :movies
  resources :users

  #--login route
  post '/login', to: 'sessions#create'

  #--logout route
  delete '/logout', to: 'sessions#destroy'

  #--Auto loging feature
  get '/me', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
