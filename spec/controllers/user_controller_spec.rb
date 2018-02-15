require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #profile" do
    it "redirects to oauth/connect when user not signed in" do
      get :profile
      expect(response).to redirect_to(login_path)
    end
  end

  describe "GET #dashboard" do
    it "redirects to oauth/connect when user not signed in" do
      get :dashboard
      expect(response).to redirect_to(login_path)
    end
  end

end
