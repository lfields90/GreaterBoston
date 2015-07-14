class City < ActiveRecord::Base
  belongs_to :state
  
  has_many :neighborhoods
  has_many :businesses, through: :neighborhoods
  has_many :events, through: :neighborhoods
  has_many :elected_officials
  has_many :city_officials, through: :elected_officials
  paginates_per 10

  validates :name, presence: true
  validates :description, presence: true
  validates :state_id, presence: true
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
