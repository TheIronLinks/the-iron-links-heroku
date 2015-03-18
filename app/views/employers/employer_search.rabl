collection @employers
attributes :id, :name, :industry, :founded, :size, :city, :state, :image_url
child(:locations) do
  attributes :city, :state, :zip, :description
  child(:job_listings) do
    attributes :name, :position, :description, :post_date
  end
end
