require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  describe "GET /users" do
    before do
      @user = create(:user)
    end
    it "リクエストが成功すること" do
      get "/api/v1/users"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "リクエストが成功すること" do
      params = attributes_for(:user)
      post "/api/v1/users", params: { user: params }
      expect(response).to have_http_status(201)
    end
  end
end
