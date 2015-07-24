require 'rails_helper'

feature "User creates an event" do

  before :each do
    user = FactoryGirl.create(:user)
    state = FactoryGirl.create(:state)
    city = FactoryGirl.create(:city, id: 1, state_id: state.id)
    FactoryGirl.create(:category, name: "Yard Sale")
    neighborhood = FactoryGirl.create(:neighborhood, city_id: city.id)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit neighborhood_events_path(neighborhood.id)

    click_link("Add an event")
  end

  scenario 'I want to create an event' do

    fill_in 'Name', with: "LaMonte's Yard Sale"
    select 'Yard Sale', from: "Category"
    fill_in 'Description', with: "This is going to be a pretty awesome Sale"
    fill_in 'Date', with: '2015-08-31T20:00:00'
    fill_in 'event[address]', with: "33 Harrison Avenue, Boston, MA"
    fill_in 'Photo url',
      with: "#{Rails.root}/spec/support/images/example_photo.jpg"
    click_button "Add new event"

    expect(page).to have_content("LaMonte's Yard Sale")
  end

  scenario 'Try to create an event while missing info' do

    fill_in 'Name', with: "LaMonte's Yard Sale"
    fill_in 'Description', with: "This is going to be a pretty awesome Sale"
    fill_in 'Photo url',
      with: "#{Rails.root}/spec/support/images/example_photo.jpg"
    click_button "Add new event"

    expect(page).to have_content("Address can't be blank")
  end
end
