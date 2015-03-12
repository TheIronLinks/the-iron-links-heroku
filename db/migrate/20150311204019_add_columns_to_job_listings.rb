class AddColumnsToJobListings < ActiveRecord::Migration
  def change
    add_column :job_listings, :employer_id, :integer
  end
end
