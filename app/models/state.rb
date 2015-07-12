class City < ActiveRecord::Base
  has_many :users
  has_many :cities
  has_many :neighborhoods
  has_many :businesses
  has_many :events
  has_many :elected_officials
  paginates_per 10

  validates :name, presence: true
  validates :description, presence: true
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
