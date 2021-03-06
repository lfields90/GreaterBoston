class Event < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :category
  belongs_to :user

  has_many :reviews, dependent: :destroy
  # has_many :attendees, dependent: :destroy
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

  # def self.avg_rating
  #   num = 0
  #   @event.reviews.each do |review|
  #     num += review.rating
  #   end
  # end
end
