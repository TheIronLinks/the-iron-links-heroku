collection @graduates
attributes :id, :first_name, :last_name, :grad_city, :grad_state, :grad_date, :grad_focus, :current_location, :additional_info, :image_url
child(:links) { attributes :url, :description }
child(:educations) { attributes :school_name, :start_date, :end_date, :concentration }
child(:experiences) { attributes :company, :position, :description }