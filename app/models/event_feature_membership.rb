class Event_Feature_Membership < ActiveRecord::Base
  belongs_to :event
  belongs_to :event_feature

  validates :event_id, presence: true
  validates :event_feature_id, presence: true
end
