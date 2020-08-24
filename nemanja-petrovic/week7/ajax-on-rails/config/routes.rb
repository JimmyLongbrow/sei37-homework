Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #frontend: a single route for our SPA interface
  get '/dashboard' => 'dashboard#app'



  #API endpoints:

  #CPU Uptime route
  get '/uptime' => 'dashboard#uptime'
  get '/cpuhog' => 'dashboard#cpu'
  get '/dogs' => 'dashboard#dogs_index'
  get '/dogs/search/:query' => 'dashboard#dogs_search'

end
