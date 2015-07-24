# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.new(first_name: "Addy",
                last_name: "Minn",
                username: "Admin",
                email: "test@test.com")
user.password = "asdfasdf"
user.password_confirmation = "asdfasdf"
user.save

state = State.find_or_create_by(name: 'Massachusetts',
                                description: "Amazing place")

Category.find_or_create_by(name: 'House Party')
Category.find_or_create_by(name: 'Concert')
Category.find_or_create_by(name: 'BlockParty')
Category.find_or_create_by(name: 'Picnic')
Category.find_or_create_by(name: 'FieldDay')
Category.find_or_create_by(name: 'BBQ')
Category.find_or_create_by(name: 'Networking')
Category.find_or_create_by(name: 'Meetup')
Category.find_or_create_by(name: 'YardSale')

city = City.find_or_create_by(name: 'Boston',
                              description: 'Awesome!',
                              state_id: state.id)
City.find_or_create_by(name: 'Cambridge',
                       description: 'Gorgeous',
                       state_id: state.id)
City.find_or_create_by(name: 'Somerville',
                       description: 'Pretty Okay',
                       state_id: state.id)
City.find_or_create_by(name: 'Watertown',
                       description: 'We caught em here',
                       state_id: state.id)

Neighborhood.find_or_create_by(name: 'Alston',
                               description: 'Nope',
                               city_id: city.id)
Neighborhood.find_or_create_by(name: 'Backbay',
                               description: 'MyTown',
                               city_id: city.id)
Neighborhood.find_or_create_by(name: 'Brighton',
                               description: 'Nice',
                               city_id: city.id)
Neighborhood.find_or_create_by(name: 'Chinatown',
                               description: 'MyTown',
                               city_id: city.id)
Neighborhood.find_or_create_by(name: 'Downtown',
                               description: 'MyTown',
                               city_id: city.id)
Neighborhood.find_or_create_by(name: 'Hyde Park',
                               description: 'MyTown',
                               city_id: city.id)
Neighborhood.find_or_create_by(name: 'NorthEnd',
                               description: 'MyTown',
                               city_id: city.id)
