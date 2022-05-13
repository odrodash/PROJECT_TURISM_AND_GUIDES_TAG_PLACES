class AddReferencesToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :guide, null: true
  end
end
