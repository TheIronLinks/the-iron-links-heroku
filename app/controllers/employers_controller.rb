class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :update, :edit, :destroy]

  def index
    @employers = Employer.all
  end

  def employer_search
    @employers = employer_search_check
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
    if params[:filters]
      @employers = simple_employer_search_results(Employer)
      @employers = advanced_employer_search_results(@employers)
    else
      simple_employer_search_results(Employer)
    end
  end

  def simple_employer_search_results(employer)
    p params[:input]
    return employer.where("name LIKE ? OR industry LIKE ? OR size LIKE ? OR city LIKE ? OR state LIKE ? OR zip LIKE ?", "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%")
  end

  def advanced_employer_search_results(employer)
    return employer.where("name LIKE ? AND industry LIKE ? AND size LIKE ?", "%#{params[:filters][:name]}%", "%#{params[:filters][:industry]}%", "%#{params[:filters][:size]}%")
  end

end
