class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :update, :edit, :destroy]

  def index
    if user_signed_in?
      if current_user.userable_type == 'Admin'
        @employers = Employer.all
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def show
    if user_signed_in?
      if current_user.userable_type == 'Admin'
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def employer_search
    @employers = search_employers(params)
    respond_to do |format|
      format.json
      format.html
    end
  end

  def get_empl
    if user_signed_in?
      @employer = Employer.find current_user.userable_id
      @messages = Message.where('receiver_id = ?', @employer.id)
    else
      @employer = []
    end
  end

  def create
    p params
    @employer = Employer.create employer_params
    @employer.full_street_address = "#{params[:employer][:address]}, #{params[:employer][:city]}, #{params[:employer][:state]} #{params[:employer][:zip]}"
    @employer.user = current_user
    @employer.save
    respond_to do |format|
      format.html{redirect_to employers_path}
      format.json{
        render nothing: true
      }
    end
  end

  def edit
    if user_signed_in?
      if current_user.userable_type == 'Admin'
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def update
    respond_to do |format|
      format.html{
        if user_signed_in?
          if current_user.userable_type == 'Admin'
            @employer.update_attributes employer_params
            redirect_to employers_path
          end
        end
      }
      format.json{
        @employer.update_attributes employer_params
        render nothing: true
      }
    end
  end

  def destroy
    @employer.destroy
    respond_to do |format|
      format.html{redirect_to employers_path}
      format.json{render nothing: true}
    end
  end

private



  def set_employer
    @employer = Employer.find params[:id]
  end

  def employer_params
    params.require(:employer).permit(
      :name,
      :industry,
      :founded,
      :size,
      :city,
      :state,
      :zip,
      :image_url,
      :motto,
      :culture_statement,
      :email,
      :address,
      :phone
    )
  end

  def search_employers(input)
    e = simple_employer_search(input)
    if input[:location] || input[:industry]
      e = advanced_employer_search(e, input)
    end
    return e
  end


  def simple_employer_search(input)
    return Employer.where("name LIKE ? OR industry LIKE ? OR size LIKE ? OR city LIKE ? OR state LIKE ? OR zip LIKE ?", "%#{input[:input]}%", "%#{input[:input]}%", "%#{input[:input]}%", "%#{input[:input]}%", "%#{input[:input]}%", "%#{input[:input]}%")
  end


  def advanced_employer_search(employers, input)
    results = []
    employers.each do |employer|
      if employer_location_check(employer, input[:location]) || !input[:location]
        if employer.industry == input[:industry] || !input[:industry]
          results.push(employer)
        end
      end
    end
    return results
  end

  def employer_location_check(employer, region)
    employer.locations.each do |location|
      return true if location.region == region
    end
    return false
  end
end
