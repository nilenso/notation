require "rails_helper"

RSpec.describe "Notes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/notes#index"
      expect(response).to have_http_status(:success)
    end
  end
end
