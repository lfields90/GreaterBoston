class Business < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :users
  has_many :events
  has_many :business_categories
  has_many :categories, through: :business_categories
  has_many :business_features
  has_many :features, through: :business_features
  paginates_per 10

  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :user, presence: true

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
