require 'rails_helper'
require 'spec_helper'

describe City do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:state_id) }
end
