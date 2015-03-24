collection @employers
attributes :id, :name, :industry, :founded, :address, :size, :city, :state, :image_url, :class, :zip, :latitude, :longitude, :phone, :culture_statement, :company_motto
child(:locations) do 
  attributes :city, :state, :zip, :description
  child(:job_listings) do
    attributes :name, :position, :description, :post_date
  end
end
