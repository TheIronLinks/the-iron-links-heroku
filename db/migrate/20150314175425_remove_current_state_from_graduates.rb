class RemoveCurrentStateFromGraduates < ActiveRecord::Migration
  def change
    remove_column :graduates, :current_state, :string
  end
end
