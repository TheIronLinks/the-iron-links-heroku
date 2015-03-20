require 'rails_helper'

RSpec.describe EmployersController, :type => :controller do
  let(:employer1){
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
  let(:employer2){
    Employer.create({
      name: 'test2',
      industry: 'test2',
      founded: 'test2',
      size: 2,
      city: 'test2',
      state: 'test2',
      zip: 'test2',
      image_url: 'test2'
    })
  }
  let(:employer3){
    Employer.create({
      name: 'test3',
      industry: 'test3',
      founded: 'test3',
      size: 3,
      city: 'test3',
      state: 'test3',
      zip: 'test3',
      image_url: 'test3'
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

    it "loads all of the posts into @posts" do
      get :index

      expect(assigns(:employers)).to match_array([employer1, employer2, employer3])
    end
  end

  describe "GET #employer_search" do
    it "returns no results if there are no results" do
      get :employer_search, :input => 'asdf'

      expect(assigns(:employers)).to match_array([])
    end
  end
end