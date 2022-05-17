class AddReferenceToReviewGuides < ActiveRecord::Migration[6.1]
  def change
    add_reference :review_guides, :user, null: true, foreign_key: true
  end
end
