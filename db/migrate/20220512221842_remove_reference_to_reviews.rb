class RemoveReferenceToReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :guide_id
  end
end
