class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :update, :edit, :destroy]

  def index
    @employers = Employer.all
  end

  def employer_search
    @employers = employer_search(params)
    respond_to do |format|
      format.json
      format.html
    end
  end

  def show
  end

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.create employer_params
    respond_to do |format|
      format.html{redirect_to employers_path}
      format.json{
        render nothing: true
      }
    end 
  end

  def edit
  end

  def update
    @employer.update_attributes employer_params
    respond_to do |format|
      format.html{redirect_to employers_path}
      format.json{render nothing: true}
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
      :image_url
    )
  end

  def employer_search(input)
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
  end
end

