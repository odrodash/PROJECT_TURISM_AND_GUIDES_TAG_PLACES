class Place < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :guides

  validates :place, presence: true
  validates :country, presence: true
  validates :description, presence: true, length: { minimum: 100, maximum: 1_000 }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  has_one_attached :photo
end
