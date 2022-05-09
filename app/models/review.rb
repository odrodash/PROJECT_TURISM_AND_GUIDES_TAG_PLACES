class Review < ApplicationRecord
  belongs_to :place
  belongs_to :guide

  validates :comment, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
