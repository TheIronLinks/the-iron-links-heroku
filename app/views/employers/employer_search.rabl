collection @employers
node(:favorited) do |employer|
  favorited(employer, current_user)
end
attributes :id, :name, :industry, :founded, :size, :city, :state, :image_url, :class
child(:locations) do
  attributes :city, :state, :zip, :description, :region
  child(:job_listings) do
    attributes :name, :position, :description, :post_date
  end
end
