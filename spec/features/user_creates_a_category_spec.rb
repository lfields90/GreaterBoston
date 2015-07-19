require 'rails_helper'

feature "User creates a category" do

  before :each do
    visit categories_path
    click_link "Add a category"
  end

  scenario 'I want to create a new category' do

    fill_in "Name", with: "Block Party"
    click_button "Add new category"
    expect(page).to have_content("Block Party")
  end

  scenario 'Try to create category while missing info' do

    click_button "Add new category"
    expect(page).to have_content("Name can't be blank")
  end
end
