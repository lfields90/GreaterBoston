require 'rails_helper'

feature "User views events in a neighborhood" do

  # As a user I want to view neighborhoods
  # so that I can decide where to hang out.
  # Acceptance criteria:
  # - User can view a list of neighborhoods and see details for each one.

  scenario 'I want to view events' do
    user = FactoryGirl.create(:user)
    state = FactoryGirl.create(:state)
    city = FactoryGirl.create(:city, state_id: state.id)
    category = FactoryGirl.create(:category)
    neighborhood = FactoryGirl.create(:neighborhood, city_id: city.id)
    event = FactoryGirl.create(
      :event,
      user_id: user.id,
      neighborhood_id: neighborhood.id,
      category_id: category.id
    )
    event2 = FactoryGirl.create(
      :event,
      user_id: user.id,
      neighborhood_id: neighborhood.id,
      category_id: category.id
    )

    visit neighborhood_events_path(neighborhood.id)

    expect(page).to have_content(event.name)
    expect(page).to have_content(event2.name)
  end
end
