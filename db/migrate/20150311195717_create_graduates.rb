class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.string :first_name
      t.string :last_name
      t.string :grad_city
      t.string :grad_state
      t.string :grad_zip
      t.date :grad_date
      t.string :grad_focus
      t.string :current_city
      t.string :current_state
      t.string :current_zip
      t.string :workflow_state
      t.text :additional_info
      t.text :image_url

      t.timestamps null: false
    end
  end
end
