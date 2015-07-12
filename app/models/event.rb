class Event < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :rsvps
  has_many :users, through: rsvps
  has_many :event_categories
  has_many :categories, through: :event_categories
  has_many :event_features
  has_many :features, through: :event_features
  paginates_per 10

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :neighborhood, presence: true
  validates :phone, presence: true
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
