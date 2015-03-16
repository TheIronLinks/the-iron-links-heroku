class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :update, :edit, :destroy]

  def index
    @employers = Employer.all
  end

  def advanced_employer_search
    employer_search_check
    @employers = advanced_employer_search_results
    respond_to do |format|
      format.json
      format.html
    end
  end

  def simple_employer_search
    employer_search_check
    @employers = simple_employer_search_results
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

  def employer_search_check
    params[:name] = '' if params[:name] == "allLocations"
    params[:industry] = '' if params[:industry] == "allIndustries"
    params[:size] = '' if params[:size] == "allSizes"
    params[:city] = '' if params[:city] == "allCities"
    params[:state] = '' if params[:state] == "allStates"
    params[:zip] = '' if params[:zip] == "allZips"
  end

  def simple_employer_search_results
    p params[:name]
    return Employer.where("name LIKE ? OR industry LIKE ? OR size LIKE ? OR city LIKE ? OR state LIKE ? OR zip LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%" "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
  end

  def advanced_employer_search_results
    return Employer.where("name LIKE ? AND industry LIKE ? AND size LIKE ? AND city LIKE ? AND state LIKE ? AND zip LIKE ?", "%#{params[:name]}%", "%#{params[:industry]}%" "%#{params[:size]}%", "%#{params[:city]}%", "%#{params[:state]}%", "%#{params[:zip]}%")
  end

end
