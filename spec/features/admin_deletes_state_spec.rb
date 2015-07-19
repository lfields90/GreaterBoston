require 'rails_helper'

 feature "Admin deletes state" do

  pending scenario 'I am an admin and I want to delete a user' do

    user = FactoryGirl.create(:admin)
    FactoryGirl.create(:state)
    FactoryGirl.create(:state)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit states_path
    first(:link, "Delete state").click
    expect(page).to have_content("State deleted")
  end
end
