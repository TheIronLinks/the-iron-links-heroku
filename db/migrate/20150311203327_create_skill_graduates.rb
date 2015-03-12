class CreateSkillGraduates < ActiveRecord::Migration
  def change
    create_table :skill_graduates do |t|
      t.integer :skill_id
      t.integer :graduate_id

      t.timestamps null: false
    end
  end
end
