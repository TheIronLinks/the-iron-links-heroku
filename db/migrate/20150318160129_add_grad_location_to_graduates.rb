class AddGradLocationToGraduates < ActiveRecord::Migration
  def change
    add_column :graduates, :grad_location, :string
    add_column :graduates, :grad_session, :string
  end
end
