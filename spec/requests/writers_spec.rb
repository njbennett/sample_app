require 'rails_helper'

RSpec.describe "Writers", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/writers/new"
      expect(response).to have_http_status(:success)
    end
  end

end
