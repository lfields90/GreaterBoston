require 'rails_helper'

feature "User views neighborhoods" do

  # As a user I want to view neighborhoods
  # so that I can decide where to hang out.
  # Acceptance criteria:
  # - User can view a list of neighborhoods and see details for each one.

  scenario 'I want to view neighborhoods' do
    state = FactoryGirl.create(:state)
    city = FactoryGirl.create(:city, state_id: state.id)
    neighborhood1 = FactoryGirl.create(:neighborhood, city_id: city.id)
    neighborhood2 = FactoryGirl.create(:neighborhood, city_id: city.id)

    visit city_neighborhoods_path(city.id)

    expect(page).to have_content(neighborhood1.name)
    expect(page).to have_content(neighborhood2.name)
  end
end
