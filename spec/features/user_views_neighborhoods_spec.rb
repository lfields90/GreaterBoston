require 'rails_helper'

feature "User views neighborhoods" do

  # As a user I want to view neighborhoods
  # so that I can decide where to hang out.
  # Acceptance criteria:
  # - User can view a list of neighborhoods and see details for each one.

  scenario 'I want to view study spots' do
    spot1 = FactoryGirl.create(:neighborhood)
    spot2 = FactoryGirl.create(:neighborhood)

    visit neighborhoods_path

    expect(page).to have_content(spot1.name)
    expect(page).to have_content(spot2.name)
  end
end
