class AddColumnFromJobListing < ActiveRecord::Migration
  def change
    add_column :job_listings, :location_id, :string
  end
end
