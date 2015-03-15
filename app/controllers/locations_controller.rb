class LocationsController < ApplicationController
  before_action :set_employer
  before_action :set_location, only: [:show, :update, :edit, :destroy]

  def index
    @locations = @employer.locations
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = @employer.locations.create location_params
    respond_to do |format|
      format.html{redirect_to employer_locations_path(@employer)}
      format.json
    end
  end

  def edit
  end

  def update
    @location.update_attributes location_params
    respond_to do |format|
      format.html{redirect_to employer_locations_path(@employer)}
      format.json
    end 
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html{redirect_to employer_locations_path(@employer)}
      format.json
    end
  end

  private
  def set_employer
    @employer = Employer.find params[:employer_id]
  end

  def set_location
    @location = Location.find params[:id]
  end

  def location_params
    params.require(:location).permit(
      :city,
      :state,
      :zip,
      :description  
    )
  end
end
