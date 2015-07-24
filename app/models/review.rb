class Review < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  paginates_per 10

  validates :rating, presence: true
  validates :rating, numericality: { greater_than: 0, less_than: 6 }
  validates :body, presence: true
  validates :event, presence: true
  validates :user, presence: true
end
