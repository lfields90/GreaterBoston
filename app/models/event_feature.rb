class Event_Feature < ActiveRecord::Base
  validates :name, presence: true
end
