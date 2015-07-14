class Event_Category_Membership < ActiveRecord::Base
  belongs_to :event
  belongs_to :event_category

  validates :event_id, presence: true
  validates :event_category_id, presence: true
end
