class GraduatesController < ApplicationController
  def index
    @graduates = Graduate.all
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
    @graduate = Graduate.create graduate_params
    respond_to do |format|
      format.html{redirect_to graduate_path(@graduate)}
      format.json do
        @graduate.user = current_user
        render nothing: true
      end
    end
  end

  def edit
    set_graduate
  end

  def update
    set_graduate
    @graduate.update_attribute graduate_params
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
      :grad_city,
      :grad_state,
      :grad_zip,
      :grad_date,
      :grad_focus,
      :current_city,
      :current_state,
      :current_zip,
      :workflow_state,
      :additional_info,
      :image_url,
      links_attributes: [:id, :url, :description, :graduate_id, :_destroy],
      experiences_attributes: [:id, :company, :description, :position, :graduate_id, :_destroy],
      educations_attributes: [:id, :school_name, :start_date, :end_date, :concentration, :graduate_id]
      )
  end
  def set_graduate
    @graduate = Graduate.find params[:id]
  end
end
