class GraduatesController < ApplicationController
  def index
    @graduates = Graduate.all
  end

  def get_grad
    @graduate = Graduate.find current_user.userable_id
  end

  def search_grads
    @graduates = graduate_search
  end

  def show
    set_graduate
    respond_to do |format|
      format.html
      format.json{render @graduate.as_json}
    end
  end



  def new
    @graduate = Graduate.new
  end

  def create
    p params
    @graduate = Graduate.create graduate_params
    @graduate.email = current_user.email
    @graduate.assign_region
    @graduate.save
    respond_to do |format|
      format.html{redirect_to graduate_path(@graduate)}
      format.json do
        handle_side_objects
        render nothing: true
      end
    end
  end

  def edit
    set_graduate
  end

  def update
    set_graduate
    @graduate.update_attributes graduate_params
    respond_to do |format|
      format.html{redirect_to graduate_path(@graduate)}
      format.json{render nothing: true}
    end
  end

  def cancel_registration
    current_user.destroy
    respond_to do |format|
      format.json{render nothing: true}
    end
  end

  def destroy
    set_graduate
    @graduate.destroy
    respond_to do |format|
      format.html{redirect_to graduates_path}
      format.json{render nothing: true}
    end
  end

  private
  def graduate_params
    params.require(:graduate).permit(
      :first_name,
      :last_name,
      :grad_location,
      :grad_zip,
      :grad_session,
      :grad_focus,
      :current_city,
      :current_state,
      :current_zip,
      :workflow_state,
      :additional_info,
      :image_url,
      :email,
      :link,
      links_attributes: [:id, :url, :description, :graduate_id, :_destroy],
      experiences_attributes: [:id, :company, :description, :position, :graduate_id, :_destroy],
      educations_attributes: [:id, :school_name, :start_date, :end_date, :concentration, :graduate_id]
      )
  end

  def simple_graduate_search(graduate)
    return graduate.where("first_name LIKE ? OR last_name LIKE ? OR grad_focus LIKE ? OR grad_session LIKE ? OR grad_year LIKE ? OR grad_location LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
  end

  def advanced_graduate_search(graduates)
    results = []
    graduates.each do |graduate|
      if graduate.grad_year == params[:filters][:grad_year] || !params[:filters][:grad_year]
        if graduate.grad_year == params[:filters][:grad_focus] || !params[:filters][:grad_focus]
          if graduate.grad_year == params[:filters][:grad_location] || !params[:filters][:grad_location]
            if graduate.grad_year == params[:filters][:present_region] || !params[:filters][:present_region]
              results.push(graduate)
            end
          end
        end
      end
      return results
    end


  end

  def graduate_search
    g = simple_graduate_search
    if params[:filters]
      g = advanced_graduate_search(g)
    end
    return g
  end
  
  def handle_side_objects
    the_link = Link.new
    the_link.url = params[:link][:url]
    @graduate.links = [the_link]
    @graduate.user = current_user
    top_education = Education.new
    top_education.school_name = params[:education][:school_name]
    top_education.concentration = params[:education][:concentration]
    top_education.level = params[:education][:level]
    @graduate.educations = [top_education]
    top_education.save
  end

  def set_graduate
    @graduate = Graduate.find params[:id]
  end
end
