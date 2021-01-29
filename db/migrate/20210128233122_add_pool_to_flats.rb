class AddPoolToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :pool, :boolean
  end
end
