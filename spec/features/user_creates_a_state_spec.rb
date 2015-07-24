require 'rails_helper'

feature "User creates a state" do

  before :each do
    user = FactoryGirl.create(:user, admin: true)
    state = FactoryGirl.create(:state)
    FactoryGirl.create(:city, state_id: state.id, id: 1)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')

    visit states_path
    click_link "Add a state"
  end

  scenario 'I want to create a new state' do

    fill_in "Name", with: "New York"
    fill_in "Description", with: "Don't live there!"
    fill_in "Website url", with: "https://www.youtube.com/watch?v=wT38J78woi4"
    click_button "Add new state"
    expect(page).to have_content("New York")
  end

  scenario 'Try to create state while missing info' do

    click_button "Add new state"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to_not have_content("Website url can't be blank")
  end
end
