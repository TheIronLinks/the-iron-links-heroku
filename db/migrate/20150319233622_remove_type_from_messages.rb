class RemoveTypeFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :type, :string
    remove_column :messages, :viewed, :boolean
  end
end
