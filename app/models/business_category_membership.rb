class Business_Category_Membership < ActiveRecord::Base
  belongs_to :business
  belongs_to :business_category

  validates :business_id, presence: true
  validates :business_category_id, presence: true
end
