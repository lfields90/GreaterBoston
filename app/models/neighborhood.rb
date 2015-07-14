class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :businesses
  has_many :events
  has_many :elected_officials
  has_many :neighborhood_officials, through: :elected_officials
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
