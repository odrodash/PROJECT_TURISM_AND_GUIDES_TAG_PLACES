class Place < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :guides, through: :bookings

  validates :place, presence: true
  has_one_attached :photo
end
