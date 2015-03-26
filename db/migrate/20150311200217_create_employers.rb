class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :industry
      t.string :founded
      t.integer :size
      t.string :city
      t.string :state
      t.string :zip
      t.text :image_url, :default => 'http://placehold.it/175x175'

      t.timestamps null: false
    end
  end
end
