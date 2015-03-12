class RemoveColumnFromJobListing < ActiveRecord::Migration
  def change
    remove_column :job_listings, :employer_id, :string
  end
end
