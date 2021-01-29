class AddBathroomToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :bathroom, :integer
  end
end
