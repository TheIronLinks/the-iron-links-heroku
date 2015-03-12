class AddColumnsToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :graduate_id, :integer
  end
end
