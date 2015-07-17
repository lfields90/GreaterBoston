# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

states = State.create([
  { name: 'Massachusetts', description: "Amazing place"},
])

sleep 1
cities = City.create([
  { name: 'Boston', description: 'Awesome!', state_id: states.first },
  { name: 'Cambridge', description: 'Gorgeous', state_id: states.first },
  { name: 'Somerville', description: 'Pretty Okay', state_id: states.first },
  { name: 'Watertown', description: 'We caught em here', state_id: states.first }
])

sleep 1
Neighborhood.create([
  { name: 'Alston', description: 'Nope', city_id: cities.first },
  { name: 'Backbay', description: 'My Town', city_id: cities.first },
  { name: 'Brighton', description: 'Nice', city_id: cities.first },
  { name: 'Chinatown', description: 'My Town', city_id: cities.first },
  { name: 'Downtown', description: 'My Town', city_id: cities.first },
  { name: 'Hyde Park', description: 'My Town', city_id: cities.first },
  { name: 'North End', description: 'My Town', city_id: cities.first },
])
