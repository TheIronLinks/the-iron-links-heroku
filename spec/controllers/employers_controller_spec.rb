require 'rails_helper'

describe EmployersController do
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

    it "loads all of the posts into @employers" do
      get :index

      expect(assigns(:employers)).to match_array([employer1, employer2, employer3])
    end
  end

  describe "GET #employer_search" do
    it "returns no results if there are no results" do
      get :employer_search, :input => 'asdf'

      expect(assigns(:employers)).to match_array([])
    end

    it "returns all results if all match input" do
      get :employer_search, :input => 'test'

      expect(assigns(:employers)).to match_array([employer1, employer2, employer3])
    end

    it "returns one result if one matches the input" do
      get :employer_search, :input => 'test2'

      expect(assigns(:employers)).to match_array([employer2])
    end
  end

  describe "POST #create" do
    it "creates a new employer" do
      post :create, :employer => {name: 'test', industry: 'test', founded: 'test', size: 0, city: 'test', state: 'test', zip: 'test', image_url: 'test'}

      expect(assigns(:employer).name).to eq 'test'
    end

    it "it doesn't create match false employers" do
      post :create, :employer => {name: 'test', industry: 'test', founded: 'test', size: 0, city: 'test', state: 'test', zip: 'test', image_url: 'test'}

      expect(assigns(:employer)).not_to eq employer1
    end
  end

  describe "PATCH #update" do
    it "updates an employers attributes" do
      patch :update, id: employer1.id, :employer => {name: 'test1', industry: 'test1', founded: 'test1', size: 0, city: 'test', state: 'test', zip: 'test', image_url: 'test'}

      expect(assigns(:employer).name).to eq 'test1'
      expect(assigns(:employer).industry).to eq 'test1'
    end
  end

  describe "DELETE #destroy" do
    it "deletes an employer" do
      delete :destroy, id: employer1.id

      expect(assigns(:employer).id).to eq employer1.id
    end
  end

end