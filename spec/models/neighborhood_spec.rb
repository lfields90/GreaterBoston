require 'rails_helper'
require 'spec_helper'

describe Neighborhood do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:city_id) }
  it { should validate_presence_of(:state_id) }
  it { should validate_presence_of(:user_id) }
end
