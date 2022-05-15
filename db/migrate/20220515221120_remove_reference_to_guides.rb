class RemoveReferenceToGuides < ActiveRecord::Migration[6.1]
  def change
    remove_column :guides, :place_id
  end
end
