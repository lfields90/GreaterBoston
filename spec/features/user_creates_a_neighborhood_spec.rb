require 'rails_helper'

feature "User creates a neighborhood" do

  before :each do
    user = FactoryGirl.create(:user, admin: true)
    state = FactoryGirl.create(:state)
    city = FactoryGirl.create(:city, state_id: state.id, id: 1)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')

    visit city_neighborhoods_path(city.id)

    click_link "Add a neighborhood"
  end

  scenario 'I want to create a new neighborhood' do

    fill_in "Name", with: "Jamaica Plain"
    fill_in "Description", with: "Pretty Awesome place to live"
    fill_in "Website url", with: "http://jamaicaplaingazette.com/"
    click_button "Add new neighborhood"
    expect(page).to have_content("Jamaica Plain")
  end

  scenario 'Try to create neighborhood while missing info' do

    click_button "Add new neighborhood"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to_not have_content("Website url can't be blank")
  end
end
