# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Fastcar.destroy.all

Fastcar.create(
  make: "McLaren",
  model: "f1",
  image: "/assets/images/mclaren.jpg",
  quatermile: "12.9",
  topspeed: "372",
  kilowatts: "461"
)
Fastcar.create(
  make: "Ferrari",
  model: "f12",
  image: "/assets/images/ferrari.jpg",
  quatermile: "10.6",
  topspeed: "340",
  kilowatts: "544"
)
Fastcar.create(
  make: "Lamborghini",
  model: "Aventador",
  image: "/assets/images/lambo.jpg",
  quatermile: "10.4",
  topspeed: "351",
  kilowatts: "565"
)
Fastcar.create(
  make: "Mercedes",
  model: "GT R",
  image: "/assets/images/mercedes.jpg",
  quatermile: "11.4",
  topspeed: "318",
  kilowatts: "430"
)
Fastcar.create(
  make: "Nissan",
  model: "Skyline GTR R34",
  image: "/assets/images/skyline.jpg",
  quatermile: "12.2",
  topspeed: "265",
  kilowatts: "298"
)

puts "Done! Created #{Fastcar.count} Cars:"
puts Fastcar.pluck( :name ).join (', ')
