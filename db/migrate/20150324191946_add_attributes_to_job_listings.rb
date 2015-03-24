class AddAttributesToJobListings < ActiveRecord::Migration
  def change
    add_column :job_listings, :url, :text
    add_column :job_listings, :responsibilities, :text
    add_column :job_listings, :prerequisites, :text
  end
end
