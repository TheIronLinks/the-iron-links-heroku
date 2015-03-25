collection @employers
node(:favorited) do |employer|
  favorited(employer, current_user)
end
attributes :id, :name, :industry, :founded, :address, :size, :city, :state, :image_url, :class, :zip, :latitude, :longitude, :phone, :culture_statement, :motto, :full_street_address, :email
child(:locations) do
  attributes :city, :state, :zip, :description, :region
  child(:job_listings) do
    attributes :name, :position, :description, :post_date
  end
end
