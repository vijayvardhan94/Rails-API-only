require 'rails_helper'

RSpec.describe "Bookstores", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/bookstore/index"
      expect(response).to have_http_status(:success)
    end
  end

end
