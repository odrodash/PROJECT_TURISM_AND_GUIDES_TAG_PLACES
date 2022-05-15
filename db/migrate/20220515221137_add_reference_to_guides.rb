class AddReferenceToGuides < ActiveRecord::Migration[6.1]
  def change
    add_reference :guides, :place, null: true
  end
end
