class AddPresentCityToGraduates < ActiveRecord::Migration
  def change
    add_column :graduates, :present_city, :string
    add_column :graduates, :present_state, :string
  end
end
