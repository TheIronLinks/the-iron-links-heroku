class CreateGradEmplFavorites < ActiveRecord::Migration
  def change
    create_table :grad_empl_favorites do |t|
      t.integer :graduate_id
      t.integer :employer_id

      t.timestamps null: false
    end
  end
end
