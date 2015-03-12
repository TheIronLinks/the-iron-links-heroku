class CreateJobListings < ActiveRecord::Migration
  def change
    create_table :job_listings do |t|
      t.string :name
      t.string :position
      t.string :description
      t.string :post_date

      t.timestamps null: false
    end
  end
end
