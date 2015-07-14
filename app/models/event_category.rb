class Event_Category < ActiveRecord::Base
  validates :name, presence: true
end
