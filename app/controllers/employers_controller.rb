class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :update, :edit, :destroy]

  def index
    @employers = Employer.all
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

end
