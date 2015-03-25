class AddPhoneToGraduate < ActiveRecord::Migration
  def change
    add_column :graduates, :phone, :string
  end
end
