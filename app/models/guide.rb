class Guide < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :places, through: :bookings

  has_one_attached :photo
end
