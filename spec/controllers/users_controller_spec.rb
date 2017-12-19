require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "users#new" do
    it "responds successfully" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end

  describe "users#new with no current user" do
    before :each do
      @current_user = nil
    end

    it "show user sign up page" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "user#new with current user" do
    it "show user index page" do
      post :create, params: {user: FactoryGirl.attributes_for(:user)}
      expect(response).to redirect_to("/login")
    end
  end
end
