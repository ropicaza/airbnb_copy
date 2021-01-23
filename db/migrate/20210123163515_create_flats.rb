class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.text :description
      t.integer :price
      t.string :location
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
