require 'sinatra'
require 'sinatra/reloader'
require 'pry' #for debugging
# require 'sqlite3' #so we can communicate with our SQL database
require 'active_record'
#Set up the ActiveRecord DB connection
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', #or :adapter => 'sqlite3', - this identifies DB type
  database: 'database.db' #location of the DB data
)
#Tell ActiveRecord how to talk to our specific 'animals' establish_conection
#... you must use the singular Capitalised version of the sql table name
class Animal < ActiveRecord::Base
  #nothing to put here! (yet)
  #... this Animal class inherits all its functionality from ActiveRecord::Base
    has_many :spotters
end #Animal
#Code inside an 'after' block is run by Sinatra after any other route handler runs
after do
  # Clean up after ourselves - close the database connection after each route is handled
  ActiveRecord::Base.connection.close
end # close connection after do
# Let's play with Active Record!
​
class Spotter < ActiveRecord::Base
​
  belongs_to :animal
end# Spotter end
​
​
# #DRY up our routes by creating a reusable DB query function
# def db_query(sql)
#   db = SQLite3::Database.new 'database.db'
#   db.results_as_hash = true
#   puts "====================================================="
#   puts sql
#   puts "====================================================="
#   results = db.execute sql
#   db.close #clean up after ourselves
#
#   results # return the results form this function
# end # db_query
#Home page route
get "/" do
  erb :'animals/home'
end #/
# CRUD System for Animals!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#Create ################################################################
# 1. Show a blank for where animal details can be added
get "/animals/new" do
  erb :'animals/new'
end # /animals/new
# 2. Form submits to the action route
post "/animals" do
  # insert_sql= "INSERT INTO animals (name, species, description, roundness, alive, age, image_url)
  #   VALUES(
  #     '#{params[:name]}',
  #     '#{params[:species]}',
  #     '#{params[:description]}',
  #     #{params[:roundness]},
  #     #{params[:alive]},
  #     #{params[:age]},
  #     '#{params[:image_url]}'
  #     );"
  #
  # #execute the query and ignore the result (i.e. assume it worked LOL!)
  # db_query insert_sql
  Animal.create(
    name: params[:name],
    species: params[:species],
    description: params[:description],
    roundness: params[:roundness],
    alive: params[:alive],
    age: params[:age],
    image_url: params[:image_url]
  )
  # redirect to the index page of all animals. From there we can see that the animal was added successfully - AND the redirect also prevents a user reload from duplicating (re-inserting) this animal into the DB
  redirect '/animals'
end # post /animals
​
​
#Read ##################################################################
# 1. Index - ist all rows in the table.
get "/animals" do
  # Get all animals from the DB using 'SELECT'
  # @results = db_query 'SELECT * FROM animals;'
  @results = Animal.all
  erb :'animals/index'
end # /animals
# 2. Detail - show all the info for a single row.
get "/animals/:id" do
  # @animal = db_query "SELECT * FROM animals WHERE id = #{params[:id]};"
  # @animal = @animal.first
  @animal = Animal.find params[:id]
  erb :'animals/show'
end # /animals/:id
#Update (edit) #########################################################
# 1. Show a form which is pre-filled with the column values for that row
get "/animals/:id/edit" do
  # @animal = db_query "SELECT * FROM animals WHERE id = #{params[:id]};"
  # @animal = @animal.first
  @animal = Animal.find params[:id]
  erb :'animals/edit'
end
# 2. Edit form submits to this action route.
post "/animals/:id" do
  # update_sql= "UPDATE animals SET
  #     name = '#{params[:name]}',
  #     species ='#{params[:species]}',
  #     description ='#{params[:description]}',
  #     roundness = #{params[:roundness]},
  #     alive = #{params[:alive]},
  #     age = #{params[:age]},
  #     image_url = '#{params[:image_url]}'
  #   WHERE id = #{ params[:id]};"
  #
  # db_query update_sql
  #First we need to retrieve from the table, the item we want to change
  animal = Animal.find params[:id]
  # now that we have the item (returned by .find, saved into 'animal')
  # We can call the update() method on it to change all its columns at once.
  Animal.update(
    name: params[:name],
    species: params[:species],
    description: params[:description],
    roundness: params[:roundness],
    alive: params[:alive],
    age: params[:age],
    image_url: params[:image_url]
  )
  #redirect to show page, usind id from current URL.
  redirect "/animals/#{params[:id]}"
end # /animals/:id post
#Delete ################################################################
# 1. Delete the specified row.
get "/animals/:id/delete" do
  # db_query "DELETE FROM animals WHERE id = #{params[:id]};"
  Animal.destroy params[:id]
  #no template to show. redirect to the index
  redirect '/animals'
end # /animals/:id/delete
####################################################################################################################################
​
#SPOTTER routes
​
#CREATE
#1.SHOW A BLANK FORM: GET/SPOTTERS/NEW
get "/spotters/new" do
  erb :'spotters/new'
end
#2.FORM SUBMITS TO HERE: POST/SPOTTERS
​
#READ
​
#1. INDEX OF ALL ROWS/ITEMS IN THE TABLE : GET/SPOTTERS
​
get "/spotters" do
  @spotters = Spotter.all
  erb :"spotters/index"
end
​
#2. SHOW PAGE - DETAILS FOR ONE ROW/ITEM: GET/SPOTTERS/:ID
# post "/spotters" do
# #UPDATE
post "/spotters" do
​
Spotter.create(
  name: params[:name],
  location: params[:location],
  animal_id: params[:animal_id],
)
​
redirect '/spotters'
​
end
​
#
# end
#1. SHOW A PRE=POPULATED FORM W/ DETAILS FOR ONE ROW ITEM: GET /SPOTTERS/:ID/EDIT
get "/spotters/:id" do
  @spotter = Spotter.find params[:id]
  erb :'spotters/show'
end
​

#2. EDIT FORMS SUBMITTED, AND WE DO A DB UPDATE: POST/SPOTTERS/# IDEA:
get "/spotters/:id/edit" do

  @spotter = Spotter.find params[:id]

  erb :'spotters/edit'
end

post "/spotters/:id" do
​
  spotter = Spotter.find params[:id]
​
  Spotter.update(
    location: params[:location],
    animal: params[:animal_id],
  )
​
  redirect "/spotters/#{params[:id]}"
end
​
get "/spotters/:id/delete" do

  Spotter.destroy params[:id]

  redirect '/spotters'
end
