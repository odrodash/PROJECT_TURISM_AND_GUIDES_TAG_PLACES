class Guide < ApplicationRecord
  belongs_to :place

  has_many :review_guides, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_one_attached :photo
end
