require 'rails_helper'
require 'spec_helper'

describe Event do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:photo_url) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:neighborhood_id) }
  it { should validate_presence_of(:category_id) }
end
