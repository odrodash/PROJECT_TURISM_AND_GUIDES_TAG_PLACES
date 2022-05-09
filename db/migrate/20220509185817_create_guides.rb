class CreateGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :guides do |t|

      t.timestamps
    end
  end
end
