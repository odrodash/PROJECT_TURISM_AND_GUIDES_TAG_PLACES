class AddReferenceToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_reference :places, :user, null: true, foreign_key: true
  end
end
