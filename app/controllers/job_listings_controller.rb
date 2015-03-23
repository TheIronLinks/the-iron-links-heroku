class JobListingsController < ApplicationController
  before_action :set_employer
  before_action :set_location
  before_action :set_job_listing, only: [:show, :update, :edit, :destroy]
  def index
    @job_listings = JobListing.all
  end

  def create
    @job_listing = @location.job_listings.create job_listing_params
    respond_to do |format|
      format.html{redirect_to employer_location_job_listings_path(@employer, @location)}
      format.json{render nothing: true}
    end 
  end

  def search_job_listings
    @job_listings = job_search(params)
    respond_to do |format|
      format.json
      format.html
    end
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
  def job_search(input)
    j = simple_job_search(input)
    if input[:type] || input[:industry] || input[:location]
      j = advanced_job_search(j, input)
    end
    return j.uniq
  end

  def simple_job_search(input)
    r = []
    r.push(JobListing.where("name LIKE ? OR position LIKE ? OR description LIKE ? OR post_date LIKE ?", "%#{input[:input]}%", "%#{input[:input]}%", "%#{input[:input]}%", "%#{input[:input]}%"))
    r.push(employer_check(input[:input]))
    r.push(location_check(input[:input]))
    return r.flatten
  end

  def location_check(input)
    l = Location.where("region LIKE ?", "%#{input}%")
    r = []
    l.each do |location|
      r.push(location.job_listings)
    end
    return r.flatten
  end

  def employer_check(input)
    r = []
    e = Employer.where('industry LIKE ?', "%#{input}%")
    e.each do |employer|
      employer.locations.each do |location|
        r.push(location.job_listings)
      end
    end
    return r.flatten
  end

  def advanced_job_search(jobs, input)
    r = []
    jobs.each do |job|
      if job.location.employer.industry == input[:industry] || !input[:industry]
        if job.location.region == input[:location] || !input[:location]
          r.push(job)
        end
      end
    end
    return r
  end

  # input
  # type(focus)
  # industry
  # region

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
