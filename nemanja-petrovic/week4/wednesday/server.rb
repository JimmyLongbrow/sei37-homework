#Load the sinatra libraries (gems)
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
get "/" do
  erb :intro
end# /
#1. Display the empty search form
get "/searchmovie" do
  erb :form
end #/searchmovie
#2. Catch the submitted form, do the movie search, and print the results.
get "/searchmovie/result" do
  @name = params[:searchmovie]
  @result = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=b0552bd9df8f09b28a6a2f18636e5e19&query=#{@name}")
  # require 'pry'; binding.pry
  p @name
end
