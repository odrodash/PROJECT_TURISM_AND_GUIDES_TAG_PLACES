class AddColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :place, null: true
  end
end
