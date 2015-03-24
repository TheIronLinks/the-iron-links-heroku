class AddLatitudeAndLongitudeToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :latitude, :float
    add_column :employers, :longitude, :float
  end
end
