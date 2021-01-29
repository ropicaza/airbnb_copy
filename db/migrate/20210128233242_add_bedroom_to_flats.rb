class AddBedroomToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :bedroom, :integer
  end
end
