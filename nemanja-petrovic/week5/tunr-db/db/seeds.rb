# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


print "Creating songs.."

Song.destroy_all

s1 = Song.create! title: 'Achy Breaky Heart'
s2 = Song.create! title: 'Have A Safe Trip, Dear'
s3 = Song.create! title: 'Burn the Witch'
s4 = Song.create! title: 'Identikit'

puts "created #{ Song.count }"

print "Creating albums.."
Artist.destroy_all

ar1 = Artist.create! name: 'Billy Ray Cyrus'
ar2 = Artist.create! name: 'June of 44'
ar3 = Artist.create! name: 'Radio Head'

puts "created #{ Artist.count }"

print "Creating Albums.."
Album.destroy_all

al1 = Album.create! title: 'Billy', year: '1992'
al2 = Album.create! title: 'June', year: '1998'
al3 = Album.create! title: 'Radio', year: '2005'

puts "created #{ Album.count }"

print "Creating Artists.."

ar1.songs << s1
ar2.songs << s2
ar3.songs << s3 << s4

al1.songs << s1
al2.songs << s2
al3.songs << s3 << s4



puts "Testing associations:"
puts "Songs bt #{Artist.last.name}"
puts Artist.last.songs.pluck(:title).join(', ')
puts "The song '#{Song.first.title}' is by #{Song.first.artist.name}"

print "The album '#{al3.title}' has the songs:"
puts al3.songs.pluck(:title).join(', ')

Genre.destroy_all

g1 = Genre.create! name: 'Nautical Rock'
g2 = Genre.create! name: 'Math Rock'
g3 = Genre.create! name: 'Paranoid Art-Rock'
g4 = Genre.create! name: 'Country'
g5 = Genre.create! name: 'Sadcore'
g6 = Genre.create! name: 'IDM'

puts "Created #{Genre.count} genres"

s1.genres << g4
s2.genres << g1 << g2
s3.genres << g3 << g5
s4.genres << g3 << g5

puts "Testing genre associations:"

print "Genre '#{g3.name}' has songs:"
puts g3.songs.pluck(:title).join(', ')

print "Song '#{s4.title}' has genres:"
puts s3.genres.pluck(:name).join(', ')

m1 = Mixtape.create! title: 'Driving Songs'
m2 = Mixtape.create! title: 'Lockdown Blues'
m3 = Mixtape.create! title: 'Code Jams'

puts "Created #{Mixtape.count} mixtapes"

#mixtapes songs many-to-many associations
m1.songs << s1 << s2 << s3 << s4
m2.songs << s1 << s4
m3.songs << s2 << s3

puts "Testing mixtape associations"
print "The mixtape '#{m1.title}' has songs:"
puts m1.songs.pluck(:title).join(', ')

User.destroy_all

u1 = User.create! email: 'organixaustralia@live.com', password: 'chicken', name: 'Nemo'
u2 = User.create! email: 'luke@ga.co', password: 'chicken', name: 'Luke'
u3 = User.create! email: 'zara@ga.co', password: 'chicken', name: 'Zara'

puts "Created #{User.count} users."

u1.mixtapes << m1 << m2
u2.mixtapes << m3

print "User #{User.first.name} has mixtapes:"
puts User.first.mixtapes.pluck(:title).join(', ')
