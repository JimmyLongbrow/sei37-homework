Rails.application.routes.draw do

  # Artists CRUD

  # CREATE
  # 1. Blank form
  # 2. Form submit, create, redirect to index

  # READ
  get 'artists/new' => 'artists#new', as: 'new_artist'
  post '/artists' => 'artists#create'
  # 1. Index page of all artists
  get '/artists' => 'artists#index'

  # 2. Show page for a single artist by ID
  # "as: 'artist'" tells rails to make the path
  # helper method with the name 'artist_path'
  get '/artists/:id' => 'artists#show', as: 'artist'

  # UPDATE
  # 1. Pre-filled form for a specific artist by ID
  get '/artists/:id/edit' => 'artists#edit', as: 'edit_artist'
  # 2. Form submit, update artist, redirect to show
  patch '/artists/:id' => 'artists#update'
  # DESTROY
  # Destroy artist row by ID, redirect to index
  delete '/artists/:id' => 'artists#destroy'

  resources :works
end
