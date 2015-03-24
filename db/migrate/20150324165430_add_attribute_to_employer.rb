class AddAttributeToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :address, :string
  end
end
