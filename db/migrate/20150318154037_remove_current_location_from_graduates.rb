class RemoveCurrentLocationFromGraduates < ActiveRecord::Migration
  def change
    remove_column :graduates, :current_location, :string
    remove_column :graduates, :current_zip, :string
  end
end
