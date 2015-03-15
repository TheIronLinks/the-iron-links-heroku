class RemoveCurrentCityFromGraduates < ActiveRecord::Migration
  def change
    remove_column :graduates, :current_city, :string
  end
end
