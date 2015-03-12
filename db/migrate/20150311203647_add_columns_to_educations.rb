class AddColumnsToEducations < ActiveRecord::Migration
  def change
    add_column :educations, :graduate_id, :integer
  end
end
