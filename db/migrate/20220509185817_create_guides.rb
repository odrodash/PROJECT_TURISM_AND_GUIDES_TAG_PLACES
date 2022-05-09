class CreateGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :guides do |t|
      t.string :guide_name
      t.string :dni
      t.string :email
      t.string :phone_number
      t.date :date_of_birth
      t.string :country
      t.string :city
      t.integer :age
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
