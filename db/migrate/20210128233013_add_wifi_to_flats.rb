class AddWifiToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :wifi, :boolean
  end
end
