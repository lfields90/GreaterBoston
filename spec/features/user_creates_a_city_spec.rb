require 'rails_helper'

feature "User creates a city" do

  before :each do
    state = FactoryGirl.create(:state)
    visit state_cities_path(state.id)
    click_link "Add a city"
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
    expect(page).to_not have_content("Website url can't be blank")
  end
end
