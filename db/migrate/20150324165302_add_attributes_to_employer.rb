class AddAttributesToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :motto, :string
    add_column :employers, :culture_statement, :text
    add_column :employers, :phone, :string
    add_column :employers, :email, :string
  end
end
