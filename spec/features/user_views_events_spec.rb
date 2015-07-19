require 'rails_helper'

feature "User views neighborhoods" do

  # As a user I want to view neighborhoods
  # so that I can decide where to hang out.
  # Acceptance criteria:
  # - User can view a list of neighborhoods and see details for each one.

  scenario 'I want to view neighborhoods' do
    user = FactoryGirl.create(:user)
    state = FactoryGirl.create(:state)
    city = FactoryGirl.create(:city, state_id: state.id)
    neighborhood = FactoryGirl.create(:neighborhood, city_id: city.id)
    event = FactoryGirl.create(
      :event,
      user_id: user.id,
      neighborhood_id: neighborhood.id,
      category_id: 
    )

    visit city_neighborhoods_path(city.id)

    expect(page).to have_content(neighborhood.name)
    expect(page).to have_content(neighborhood2.name)
  end
end
