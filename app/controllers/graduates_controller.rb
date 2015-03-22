class GraduatesController < ApplicationController
  def index
    @graduates = Graduate.all
  end

  def get_grad
    if user_signed_in?
      @graduate = Graduate.find current_user.userable_id
      @messages = Message.where('receiver_id = ?', '#{@graduate.id}')
    else
      @graduate = []
    end
  end

  def search_graduates
    @graduates = graduate_search
  end

  def create
    @graduate = Graduate.create graduate_params
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

  def update
    set_graduate
    @graduate.update_attributes graduate_params
    respond_to do |format|
      format.html{redirect_to graduate_path(@graduate)}
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
      :current_zip,
      :workflow_state,
      :additional_info,
      :image_url,
      :link,
      :grad_year,
      :present_city,
      :present_state,
      links_attributes: [:id, :url, :description, :graduate_id, :_destroy],
      experiences_attributes: [:id, :company, :description, :position, :graduate_id, :_destroy],
      educations_attributes: [:id, :school_name, :start_date, :end_date, :concentration, :graduate_id]
      )
  end

  def simple_graduate_search(graduate)
    return graduate.where("first_name LIKE ? OR last_name LIKE ? OR grad_focus LIKE ? OR grad_session LIKE ? OR grad_year LIKE ? OR grad_location LIKE ?", "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%")
  end

  def advanced_graduate_search(graduates)
     results = []
     graduates.each do |graduate|
      if graduate.grad_year == params[:tiy_year] || !params[:tiy_year]
        if graduate.grad_focus == params[:type] || !params[:type]
          if graduate.grad_location == params[:tiy_location] || !params[:tiy_location]
            if graduate.present_region == params[:current_location] || !params[:current_location]
               results.push(graduate)
            end
          end
        end
      end
    end
    return results
  end

  def graduate_search
    g = simple_graduate_search(Graduate)
    if params[:tiy_year] || params[:type] || params[:tiy_location] || params[:current_location]
      g = advanced_graduate_search(g)
    end
    return g
  end

  def handle_side_objects
    the_link = Link.new
    the_link.url = params[:link][:url]
    @graduate.links = [the_link]
    if user_signed_in?
      @graduate.user = current_user
    end
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
