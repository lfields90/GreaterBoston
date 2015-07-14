class State < ActiveRecord::Base
  belongs_to :user

  has_many :cities
  has_many :neighborhoods, through: :cities
  has_many :businesses, through: :neighborhoods
  has_many :events, through: :neighborhoods
  has_many :elected_officials
  paginates_per 10

  validates :name, presence: true
  validates :description, presence: true

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
