require 'rails_helper'

feature "User creates a city" do

  before :each do
    user = FactoryGirl.create(:user, admin: true)
    state = FactoryGirl.create(:state)
    FactoryGirl.create(:city, state_id: state.id) # id: 1
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')

    visit new_state_city_path(state.id)
  end

  scenario 'I want to create a new city' do

    fill_in "Name", with: "Cambridge"
    fill_in "Description", with: "Pretty Awesome place to live"
    fill_in "Website url", with: "https://www.cambridgema.gov/"
    click_button "Add new city"
    expect(page).to have_content("Cambridge")
  end

  scenario 'Try to create city while missing info' do

    click_button "Add new city"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
