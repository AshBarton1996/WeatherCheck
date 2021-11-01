require 'rails_helper'

RSpec.describe "Weather", type: :request do
  describe "GET #index" do
    it "is a success" do
      get weather_path
      expect(response).to have_http_status(200)
    end
  end
end
