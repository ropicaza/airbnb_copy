class AddGuestsToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :guests, :integer
  end
end
