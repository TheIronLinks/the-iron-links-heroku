require 'rails_helper'

describe JobListingsController do
  include Devise::TestHelpers
  let(:job_listing1){
    JobListing.create({
      name: 'test',
      description: 'test',
      position: 'test',
      post_date: 'test'
    })
  }
  let(:job_listing2){
    JobListing.create({
      name: 'test2',
      description: 'test2',
      position: 'test2',
      post_date: 'test2'
    })
  }
  let(:job_listing3){
    JobListing.create({
      name: 'test3',
      description: 'test3',
      position: 'test3',
      post_date: 'test3'
    })
  }
  let(:employer){
    Employer.create({
      name: 'test',
      industry: 'test',
      founded: 'test',
      size: 1,
      city: 'test',
      state: 'test',
      zip: 'test',
      image_url: 'test'
    })
  }
  let(:location){
    Location.create({
      city: 'test',
      state: 'SC',
      zip: 'test',
      description: 'test'
    })
  }
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @employers" do
      get :index

      expect(assigns(:job_listings)).to match_array([job_listing1, job_listing2, job_listing3])
    end
  end

  describe "GET #search_job_listings" do
    it "returns no results if there are no results" do
      get :search_job_listings, :input => 'asdf'

      expect(assigns(:job_listings)).to match_array([])
    end

    it "returns all results if all match input" do
      get :search_job_listings, :input => 'test'

      expect(assigns(:job_listings)).to match_array([job_listing1, job_listing2, job_listing3])
    end

    it "returns one result if one matches the input" do
      get :search_job_listings, :input => 'test2'

      expect(assigns(:job_listings)).to match_array([job_listing2])
    end

    it "returns filtered results" do
      employer.location = location
      job_listing2.location = location
      get :search_job_listings, :industry => 'test2'

      expect(assigns(:job_listings)).to match_array([job_listing2])
    end
  end

  # describe "POST #create" do
  #   it "creates a new employer" do
  #     post :create, :graduate => {
  #     first_name: 'test',
  #     last_name: 'test',
  #     grad_focus: 'test',
  #     additional_info: 'test',
  #     email: 'test',
  #     present_city: 'test',
  #     present_state: 'SC',
  #     grad_location: 'test',
  #     grad_session: 'test',
  #     grad_year: 'test',
  #     image_url: 'test'
  #   }

  #     expect(assigns(:graduate).first_name).to eq 'test'
  #   end

  #   it "it doesn't create match false employers" do
  #     post :create, :graduate => {
  #     first_name: 'test',
  #     last_name: 'test',
  #     grad_focus: 'test',
  #     additional_info: 'test',
  #     email: 'test',
  #     present_city: 'test',
  #     present_state: 'SC',
  #     grad_location: 'test',
  #     grad_session: 'test',
  #     grad_year: 'test',
  #     image_url: 'test'
  #   }

  #     expect(assigns(:graduate)).not_to eq graduate1
  #   end

  #   it "handles side objects" do
  #     post :create, 
  #     :graduate => {
  #       first_name: 'test',
  #       last_name: 'test',
  #       grad_focus: 'test',
  #       additional_info: 'test',
  #       email: 'test',
  #       present_city: 'test',
  #       present_state: 'SC',
  #       grad_location: 'test',
  #       grad_session: 'test',
  #       grad_year: 'test',
  #       image_url: 'test'
  #     }, 
  #     :link => {
  #       url: 'test'
  #     }, 
  #     :education => {
  #       school_name: 'test',
  #       concentration: 'test',
  #       level: 'test'
  #     },
  #     :format => :json

  #     expect(assigns(:graduate).links[0].url).to eq 'test'
  #   end
  # end

  # describe "PATCH #update" do
  #   it "updates an employers attributes" do
  #     patch :update, id: graduate1.id, :graduate => {
  #     first_name: 'testy',
  #     last_name: 'testy',
  #     grad_focus: 'test',
  #     additional_info: 'test',
  #     email: 'test',
  #     present_city: 'test',
  #     present_state: 'SC',
  #     grad_location: 'test',
  #     grad_session: 'test',
  #     grad_year: 'test',
  #     image_url: 'test'
  #   }

  #     expect(assigns(:graduate).first_name).to eq 'testy'
  #     expect(assigns(:graduate).last_name).to eq 'testy'
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "deletes an employer" do
  #     delete :destroy, id: graduate1.id

  #     expect(assigns(:graduate).id).to eq graduate1.id
  #   end
  # end

end