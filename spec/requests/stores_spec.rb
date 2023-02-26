require 'rails_helper'

RSpec.describe "Stores", type: :request do
  describe "GET /index" do
    it "gets all stores" do
      get '/api/v2/stores'
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /stores" do
    it "creates a store" do
      post '/api/v2/stores/', params: {store: {name:"Test Store", address: "Test Address"}}
      expect(response).to have_http_status(:created)
    end
  end

  describe "SHOW /stores" do
    it "returns a single store" do
      store = FactoryBot.create(:store, name: "Test Store", address: "Test Address")
      get "/api/v2/stores/#{store.id}"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(store.id)
      expect(JSON.parse(response.body)['name']).to eq(store.name)
      expect(JSON.parse(response.body)['address']).to eq(store.address)

    end
  end

end
