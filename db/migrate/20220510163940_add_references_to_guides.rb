class AddReferencesToGuides < ActiveRecord::Migration[6.1]
  def change
    add_reference :guides, :place, null: false, foreign_key: true
  end
end
