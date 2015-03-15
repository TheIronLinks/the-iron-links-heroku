class JobListingsController < ApplicationController
  before_action :set_employer
  before_action :set_location
  before_action :set_job_listing, only: [:show, :update, :edit, :destroy]
  def index
    if params[:location_id]
      @job_listings = @location.job_listings
    else
      @job_listings = JobListing.all
    end
  end

  def show
  end

  def new
    @location = Location.find params[:location_id]
    @job_listing = JobListing.new
  end

  def create
    @job_listing = @location.job_listings.create job_listing_params
    respond_to do |format|
      format.html{redirect_to employer_location_job_listings_path(@employer, @location)}
      format.json{render nothing: true}
    end 
  end

  def edit
  end

  def update
    @job_listing.update_attributes job_listing_params
    respond_to do |format|
      format.html{redirect_to employer_location_job_listings_path(@employer, @location)}
      format.json{render nothing: true}
    end 
  end

  def destroy
    @job_listing.destroy
    respond_to do |format|
      format.html{redirect_to employer_location_job_listings_path(@employer, @location)}
      format.json{render nothing: true}
    end 
  end

  private
  def set_employer
    if params[:employer_id]
      @employer = Employer.find params[:employer_id]
    end
  end

  def set_location
    if params[:location_id]
      @location = Location.find params[:location_id]
    end
  end

  def set_job_listing
    @job_listing = JobListing.find params[:id]
  end

  def job_listing_params
    params.require(:job_listing).permit(
      :name,
      :position,
      :description,
      :post_date
    )
  end
end
