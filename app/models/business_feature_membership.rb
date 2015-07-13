class Business_Feature_Membership < ActiveRecord::Base
  belongs_to :business
  belongs_to :business_feature

  validates :business_id, presence: true
  validates :business_feature_id, presence: true
end
