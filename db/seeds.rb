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
                admin: true,
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

Neighborhood.find_or_create_by(
  name: 'Alston',
  description: 'This radiant neighborhood is best known for its student
  population due to its proximity to many colleges and universities. The varied
  mix of people living here creates one of the most energetic and diverse
  populations in Boston. ',
  city_id: city.id
)
Neighborhood.find_or_create_by(
  name: 'Backbay',
  description: 'Newbury Street, Boylston Street and Commonwealth Avenue are
  lined with unique shops, trendy restaurants and vintage homes, making the Back
  Bay an extremely fashionable destination for Boston residents and visitors.',
  city_id: city.id
)
Neighborhood.find_or_create_by(
  name: 'Brighton',
  description: "Multi-family homes and condominiums line the streets of this
  welcoming neighborhood located in the northwest corner of Boston. Many of
  Brighton's small businesses are located along Washington St, which runs
  straight through Brighton Cntr to Oak Sq.",
  city_id: city.id
)
Neighborhood.find_or_create_by(
  name: 'Chinatown',
  description: "Boston's Chinatown, located between the city's Financial District
  and Theater District, is the third largest Chinese neighborhood in the country.
  Locals and tourists alike are drawn to the area’s large selection of Asian
  restaurants and bakeries.",
  city_id: city.id
)
Neighborhood.find_or_create_by(
  name: 'Downtown',
  description: "Boston's center of business and government combine with the
  Boston Common and the Public Garden to form a dynamic downtown. Downtown also
  serves as a sanctuary for shoppers, offering everything from large department
  stores to cozy boutiques.",
  city_id: city.id
)
Neighborhood.find_or_create_by(
  name: 'Hyde Park',
  description: "As Boston's southernmost neighborhood, Hyde Park offers the
  intangibles of city life as well as the open space associated
  with the suburbs. Its unmatched community spirit is on display in the many
  small shops and eateries along Hyde Park Ave and River St.",
  city_id: city.id
)
