class AddAttributesToGraduates < ActiveRecord::Migration
  def change
    add_column :graduates, :title, :string
  end
end
