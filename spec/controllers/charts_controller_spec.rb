require 'rails_helper'

RSpec.describe ChartsController, type: :controller do
  let!(:admin) { login_admin }

  describe "GET #index" do
    before { get :index }
      it "assigns all @charts for index" do
        expect(assigns(:charts)).not_to be_nil
      end
      it "gets the index page successfully" do
        expect(response).to be_success
      end
      it "renders the index template" do
        expect(response).to render_template("index")
      end
  end

  describe "GET #new" do
    before { get :new }
      it "assigns @chart" do
        expect(assigns(:chart)).to be_a_new(Chart)
      end
      it "gets new chart form successfully" do
        expect(response).to be_success
      end
      it "renders the new template" do
        expect(response).to render_template("new")
      end
  end

  describe "POST #create" do
    context "when user submits project info" do
      it "adds a new chart successfully" do 
        post :create, chart: attributes_for(:chart)
        expect(Chart.count).to eq(1)
      end
      it "show My Projects page" do
        post :create, chart: attributes_for(:chart)
        expect(:chart).to redirect_to("/my_projects")
      end
      it "flashes a success notice" do
        post :create, chart: attributes_for(:chart)
        expect(flash[:success]).to eq("You're off to a great start!")
      end
    end
  end

  describe "GET #my_projects" do
    before { get :my_projects }
      it "successfully gets the My Projects page" do
        expect(response).to be_success
      end
      it "shows admin's existing projects" do
        expect(assigns(:charts)).not_to be_nil
      end
    end
  end
