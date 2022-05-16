class Guide < ApplicationRecord
  belongs_to :place

  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_one_attached :photo
end
