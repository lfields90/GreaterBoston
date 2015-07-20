# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

state = State.find_or_create_by( name: 'Massachusetts', description: "Amazing place" )
puts "Created a state."

Category.find_or_create_by( name: 'House Party' )
Category.find_or_create_by( name: 'Concert' )
Category.find_or_create_by( name: 'Block Party' )
Category.find_or_create_by( name: 'Picnic' )
Category.find_or_create_by( name: 'Field Day' )
Category.find_or_create_by( name: 'BBQ' )
Category.find_or_create_by( name: 'Networking' )
Category.find_or_create_by( name: 'Meetup' )
Category.find_or_create_by( name: 'Yard Sale' )
puts "Created catagories."

city = City.find_or_create_by( name: 'Boston', description: 'Awesome!', state_id: state.id )
City.find_or_create_by( name: 'Cambridge', description: 'Gorgeous', state_id: state.id )
City.find_or_create_by( name: 'Somerville', description: 'Pretty Okay', state_id: state.id )
City.find_or_create_by( name: 'Watertown', description: 'We caught em here', state_id: state.id )
puts "Created cities."

Neighborhood.find_or_create_by( name: 'Alston', description: 'Nope', city_id: city.id )
Neighborhood.find_or_create_by( name: 'Backbay', description: 'My Town', city_id: city.id )
Neighborhood.find_or_create_by( name: 'Brighton', description: 'Nice', city_id: city.id )
Neighborhood.find_or_create_by( name: 'Chinatown', description: 'My Town', city_id: city.id )
Neighborhood.find_or_create_by( name: 'Downtown', description: 'My Town', city_id: city.id )
Neighborhood.find_or_create_by( name: 'Hyde Park', description: 'My Town', city_id: city.id )
Neighborhood.find_or_create_by( name: 'North End', description: 'My Town', city_id: city.id )
puts "Created Neighborhoods."
