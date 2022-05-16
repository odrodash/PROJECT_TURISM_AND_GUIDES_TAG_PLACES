class CreateReviewGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :review_guides do |t|
      t.string :comment
      t.integer :rating
      t.references :guide, null: false, foreign_key: true

      t.timestamps
    end
  end
end
