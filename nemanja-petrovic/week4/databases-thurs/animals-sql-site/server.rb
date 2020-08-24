require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'

require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
)

#DRYS RESUSABLE DB QUERY CODE

def db_query( sql )

  db = SQLite3::Database.new 'database.db'
  db.results_as_hash = true
  #debugging ouput
  puts "====================================================="
  puts sql
  puts "====================================================="
  results = db.execute sql
  db.close

  results
end

get "/" do
  erb :home
end

#setup sql data collection via CRUD SYSTEM

#CREATE###################################################################
#1. SHOW BLANK FORM WHERE DEETS CAN BE ADDED
get "/animals/new" do
  erb :new
end

#2.FORM SUBMITS TO EACH ACTION ROUTE

post "/animals" do
  insert_sql ="INSERT INTO animals (name,species,description,roundness,alive,age,image_url)
  VALUES(
  '#{params[:name]}',
  '#{params[:species]}',
  '#{params[:description]}',
   #{params[:roundness]},
   #{params[:alive]},
   #{params[:age]},
  '#{params[:image_url]}'
  );"

  db_query insert_sql
#redirect to the index page of all animals
#from there we can see new updates
  redirect '/animals'
end

#READ#####################################################################
#1.INDEX - LIST OF ALL ROWS IN TABLE
get "/animals" do
  #gets all lists from db using 'select'
  @results = db_query 'SELECT * FROM animals;'

  erb :index
end

#2.DETAIL - SHOW ALL THE INFO FOR A SINGLE ROW

get "/animals/:id" do

  @animal = db_query "SELECT * FROM animals WHERE id = #{params[:id]};"
  @animal = @animal.first

  erb :show
end

#UPDATE###################################################################
#1.SHOW A FORM WHICH IS PREFILLED W/ COLUMN VALUES THAT YOU DECIDE TO EDIT

get "/animals/:id/edit" do
  @animal = db_query "SELECT * FROM animals WHERE id = #{ params[:id] };"
  @animal = @animal.first
  erb :edit
end  # /animals/:id/edit

#2.EDIT FORM SUBMITS TO THIS ACTION ROUTE

post "/animals/:id" do
  update_sql ="UPDATE animals SET
  name = '#{params[:name]}',
  species = '#{params[:species]}',
  description = '#{params[:description]}',
  roundness = #{params[:roundness]},
  alive = #{params[:alive]},
  age = #{params[:age]},
  image_url = '#{params[:image_url]}'
  WHERE id = #{params[:id]};"

  db_query update_sql
  #redirect to show page. using current url
  redirect "/animals/#{params[:id]}"
end

#DELETE###################################################################
#1. DELETE THE SPECIFIED ROW

get "/animals/:id/delete" do
  db_query "DELETE FROM animals WHERE id = #{params[:id]};"
  redirect "/animals"
end
