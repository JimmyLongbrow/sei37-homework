Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Create
  #1.
  get '/fastcars/new' => 'fastcars#new'
  #2.
  get '/fastcars' => 'fastcars#create'
  #Read
  #1.
  get '/fastcars' => 'fastcars#index'
  #2.
  get '/fastcars/:id' => 'fastcars#show', as: 'fastcar'

  #Update
  #1.
  get '/fastcars/:id/edit' => 'fastcars#edit', as: 'fastcar_edit'
  #2.
  post '/fastcars/:id' => 'fastcars#update'
  #Delete
  #1.
  get '/fastcars/:id/destroy' => 'fastcars#destroy', as: 'fastcar_destroy'
end
