class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :title
      t.text :content
      t.string :type
      t.boolean :viewed, default: false

      t.timestamps null: false
    end
  end
end
