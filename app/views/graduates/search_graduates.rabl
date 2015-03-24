collection @graduates
attributes :id, :first_name, :last_name, :grad_location, :grad_focus, :current_location, :additional_info, :image_url, :grad_year, :grad_session, :present_region, :class, :email, :present_city, :present_state, :title
child(:links) { attributes :url, :description }
child(:educations) { attributes :school_name, :start_date, :end_date, :concentration }
child(:experiences) { attributes :company, :position, :description }
