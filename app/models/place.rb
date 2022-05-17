class Place < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :guides

  belongs_to :user

  validates :place, presence: true
  validates :photo, presence: true
  validates :country, presence: true
  validates :description, presence: true, length: { minimum: 60, maximum: 1_000 }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }

  has_one_attached :photo
end
