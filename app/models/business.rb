class Business < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :events
  has_many :business_category_memberships
  has_many :business_categories, through: :business_category_memberships
  has_many :business_feature_memberships
  has_many :business_features, through: :business_feature_memberships
  paginates_per 10

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true, length: { is: 5 }
  validates :neighborhood_id, presence: true
  validates :phone, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true

  def self.search(search)
    where("name ILIKE ?
          OR description ILIKE ?
          OR address ILIKE ?
          OR zip_code ILIKE ?
          OR city ILIKE ?
          OR state ILIKE ?
          OR category ILIKE ? ",
          "%#{search}%", "%#{search}%", "%#{search}%",
          "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"
        )
  end
end
