require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "sessions#new" do
    it "responds successfully" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end
end
