require 'rails_helper'

feature "User creates a state" do

  before :each do
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
