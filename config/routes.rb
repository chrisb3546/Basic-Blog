Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :blogs
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
