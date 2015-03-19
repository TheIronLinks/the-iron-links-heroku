class AddGradYearToGraduates < ActiveRecord::Migration
  def change
    add_column :graduates, :grad_year, :string
  end
end
