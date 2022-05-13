class AddCountryAndDescriptionToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :country, :string
    add_column :places, :description, :text
    add_column :places, :rating, :integer
  end
end
