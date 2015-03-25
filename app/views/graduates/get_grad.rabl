object @graduate
attributes :id, :first_name, :last_name, :grad_location, :grad_focus, :current_location, :additional_info, :image_url, :grad_year, :grad_session, :present_region, :class, :email, :present_city, :present_state, :title, :phone

child(:educations) do
  attributes :school_name, :level, :concentraton
end

node(:favorites) do
  @graduate.favorited_employers
end

child(@messages) do
 attributes :id, :sender_id, :receiver_id, :title, :content, :viewed, :message_type
end

child(:links) do
  attributes :url, :description
end
