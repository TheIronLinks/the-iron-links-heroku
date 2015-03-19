class AddPresentRegionToGraduates < ActiveRecord::Migration
  def change
    add_column :graduates, :present_region, :string
  end
end
