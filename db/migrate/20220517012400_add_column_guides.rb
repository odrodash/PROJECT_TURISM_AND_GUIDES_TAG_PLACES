class AddColumnGuides < ActiveRecord::Migration[6.1]
  def change
    add_reference :guides, :user, null: true, foreign_key: true
  end
end
