class AddLevelToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :level, :string
  end
end
