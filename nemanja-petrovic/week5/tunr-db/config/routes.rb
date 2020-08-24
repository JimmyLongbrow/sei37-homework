Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#welcome'
  get '/home' => 'pages#home'

  #Session routes
  get '/login' => 'session#new' #loginform
  post '/login' => 'session#create' #submit form do authenticate and create session
  delete '/login' => 'session#destroy' #logout
  resources :users #CRUD URLS
  resources :mixtapes
end
