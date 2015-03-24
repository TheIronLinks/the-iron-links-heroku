class AddFullStreetAddressToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :full_street_address, :text
  end
end
