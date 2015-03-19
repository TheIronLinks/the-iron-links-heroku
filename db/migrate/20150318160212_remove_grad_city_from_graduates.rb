class RemoveGradCityFromGraduates < ActiveRecord::Migration
  def change
    remove_column :graduates, :grad_city, :string
    remove_column :graduates, :grad_state, :string
    remove_column :graduates, :grad_zip, :string
    remove_column :graduates, :grad_date, :string
  end
end
