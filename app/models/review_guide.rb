class ReviewGuide < ApplicationRecord
  belongs_to :guide
  belongs_to :user

  validates :comment, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
