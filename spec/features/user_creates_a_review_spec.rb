require 'rails_helper'

feature "User creates a review" do

  before :each do
    state = FactoryGirl.create(:state)
    city = FactoryGirl.create(:city, state_id: state.id)
    neighborhood = FactoryGirl.create(:neighborhood, city_id: city.id)
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    event = FactoryGirl.create(:event, user_id: user.id, neighborhood_id: neighborhood.id, category_id: category.id)

    visit event_path(event.id)
    click_link "Add a review"
  end

  pending scenario 'I want to create a new review' do

    choose "5"
    fill_in "Body", with: "Amazing event! Bra-Vo"
    click_button "Add Review"
    expect(page).to have_content("Amazing event! Bra-Vo")
  end

  pending scenario 'Try to create a review while missing info' do

    click_button "Add Review"
    expect(page).to have_content("Rating can't be blank")
    expect(page).to have_content("Body can't be blank")
  end

  pending scenario 'Try to create a review while missing body info' do

    choose "5"
    click_button "Add Review"
    expect(page).to have_content("Body can't be blank")
  end

  pending scenario 'Try to create a review while missing rating info' do

    fill_in "Body", with: "Mehhh, it was alright, I guess."
    click_button "Add Review"
    expect(page).to have_content("Rating can't be blank")
  end
end
