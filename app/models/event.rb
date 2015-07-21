class Event < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :category
  belongs_to :user

  has_many :attendees
  has_many :users, through: :attendees
  paginates_per 10

  validates :name, presence: true, length: { maximum: 140 }
  validates :description, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validates :photo_url, presence: true
  validates :user_id, presence: true
  validates :neighborhood_id, presence: true
  validates :category_id, presence: true

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
