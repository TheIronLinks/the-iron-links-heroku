require 'rails_helper'

describe GraduatesController do
  let(:graduate1){
    Graduate.create({
      first_name: 'test',
      last_name: 'test',
      grad_focus: 'test',
      additional_info: 'test',
      email: 'test',
      present_city: 'test',
      present_state: 'SC',
      grad_location: 'test',
      grad_session: 'test',
      grad_year: 'test',
      image_url: 'test'
    })
  }
  let(:graduate2){
    Graduate.create({
      first_name: 'test2',
      last_name: 'test2',
      grad_focus: 'test2',
      additional_info: 'test2',
      email: 'test2',
      present_city: 'test2',
      present_state: 'NY',
      grad_location: 'test2',
      grad_session: 'test2',
      grad_year: 'test2',
      image_url: 'test2'
    })
  }
  let(:graduate3){
    Graduate.create({
      first_name: 'test3',
      last_name: 'test3',
      grad_focus: 'test3',
      additional_info: 'test3',
      email: 'test3',
      present_city: 'test3',
      present_state: 'CA',
      grad_location: 'test3',
      grad_session: 'test3',
      grad_year: 'test3',
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

      expect(assigns(:graduates)).to match_array([graduate1, graduate2, graduate3])
    end
  end

  describe "GET #get_grad" do 
    it "doesn't load a graduate if no current_user" do
      get :get_grad

      expect(assigns(:graduate)).to match_array([])
    end
  end

  describe "GET #search_graduates" do
    it "returns no results if there are no results" do
      get :search_graduates, :input => 'asdf'

      expect(assigns(:graduates)).to match_array([])
    end

    it "returns all results if all match input" do
      get :search_graduates, :input => 'test'

      expect(assigns(:graduates)).to match_array([graduate1, graduate2, graduate3])
    end

    it "returns one result if one matches the input" do
      get :search_graduates, :input => 'test2'

      expect(assigns(:graduates)).to match_array([graduate2])
    end

    it "returns filtered results" do
      graduate2
      get :search_graduates, :tiy_location => 'test2'

      expect(assigns(:graduates)).to match_array([graduate2])
    end
  end

  describe "POST #create" do
    it "creates a new employer" do
      post :create, :graduate => {
      first_name: 'test',
      last_name: 'test',
      grad_focus: 'test',
      additional_info: 'test',
      email: 'test',
      present_city: 'test',
      present_state: 'SC',
      grad_location: 'test',
      grad_session: 'test',
      grad_year: 'test',
      image_url: 'test'
    }

      expect(assigns(:graduate).first_name).to eq 'test'
    end

    it "it doesn't create match false employers" do
      post :create, :graduate => {
      first_name: 'test',
      last_name: 'test',
      grad_focus: 'test',
      additional_info: 'test',
      email: 'test',
      present_city: 'test',
      present_state: 'SC',
      grad_location: 'test',
      grad_session: 'test',
      grad_year: 'test',
      image_url: 'test'
    }

      expect(assigns(:graduate)).not_to eq graduate1
    end

    it "handles side objects" do
      post :create, :graduate => {
      first_name: 'test',
      last_name: 'test',
      grad_focus: 'test',
      additional_info: 'test',
      email: 'test',
      present_city: 'test',
      present_state: 'SC',
      grad_location: 'test',
      grad_session: 'test',
      grad_year: 'test',
      image_url: 'test'
    }, :link => {url: 'test'}, :format => :json

      expect(assigns(:graduate).links).to eq nil
    end
  end

  describe "PATCH #update" do
    it "updates an employers attributes" do
      patch :update, id: graduate1.id, :graduate => {
      first_name: 'testy',
      last_name: 'testy',
      grad_focus: 'test',
      additional_info: 'test',
      email: 'test',
      present_city: 'test',
      present_state: 'SC',
      grad_location: 'test',
      grad_session: 'test',
      grad_year: 'test',
      image_url: 'test'
    }

      expect(assigns(:graduate).first_name).to eq 'testy'
      expect(assigns(:graduate).last_name).to eq 'testy'
    end
  end

  describe "DELETE #destroy" do
    it "deletes an employer" do
      delete :destroy, id: graduate1.id

      expect(assigns(:graduate).id).to eq graduate1.id
    end
  end

end