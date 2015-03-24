object @employer

attributes :id, :name, :industry, :founded, :address, :size, :city, :state, :image_url, :class, :zip, :latitude, :longitude, :phone, :culture_statement, :motto, :full_street_address, :email

node(:favorites) do
  @employer.graduate_favorites
end

child(@messages) do
 attributes :id, :sender_id, :receiver_id, :title, :content, :viewed, :message_type
end
