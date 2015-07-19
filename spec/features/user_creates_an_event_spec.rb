require 'rails_helper'

feature "User creates an event" do

  # As a user I want to view neighborhoods
  # so that I can decide where to hang out.
  # Acceptance criteria:
  # - User can view a list of neighborhoods and see details for each one.

  before :each do
    user = FactoryGirl.create(:user)
    state = FactoryGirl.create(:state)
    city = FactoryGirl.create(:city, state_id: state.id)
    neighborhood = FactoryGirl.create(:neighborhood, city_id: city.id)
    FactoryGirl.create(:category, name: "Yard Sale")
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit neighborhood_events_path(neighborhood.id)

    click_link("Add an event")
  end

  scenario 'I want to create an event' do

    fill_in 'Name', with: "LaMonte's Yard Sale"
    fill_in 'Description', with: "This is going to be a pretty awesome Sale"
    select 'Yard Sale', from: "Category"
    fill_in 'Address', with: "Somewhere in Boston-ish"
    fill_in 'Zip code', with: "00101"
    fill_in 'Phone', with: "1001101010"
    fill_in 'Photo url',
      with: "#{Rails.root}/spec/support/images/example_photo.jpg"
    click_button "Add new event"

    expect(page).to have_content("LaMonte's Yard Sale")
  end

  scenario 'Try to create an event while missing info' do

    fill_in 'Name', with: "LaMonte's Yard Sale"
    fill_in 'Description', with: "This is going to be a pretty awesome Sale"
    fill_in 'Address', with: "Somewhere in Boston-ish"
    fill_in 'Zip code', with: "00101"
    fill_in 'Photo url',
      with: "#{Rails.root}/spec/support/images/example_photo.jpg"
    click_button "Add new event"

    expect(page).to have_content("Phone is too short ")
    expect(page).to have_content("Phone can't be blank")
  end
end
