class AddColumnsToLink < ActiveRecord::Migration
  def change
    add_column :links, :graduate_id, :integer
  end
end
