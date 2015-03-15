class AddCurrentLocationToGraduates < ActiveRecord::Migration
  def change
    add_column :graduates, :current_location, :string
  end
end
