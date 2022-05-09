class Booking < ApplicationRecord
  belongs_to :place
  belongs_to :guide
  belongs_to :user

  validates :date, presence: true

end
