class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school_name
      t.string :start_date
      t.string :end_date
      t.string :concentration

      t.timestamps null: false
    end
  end
end
