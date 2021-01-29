class AddRatingToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :rating, :integer
  end
end
