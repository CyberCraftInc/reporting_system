require 'rails_helper'

RSpec.describe "Messagetypes", :type => :request do
  describe "GET /messagetypes" do
    it "works! (now write some real specs)" do
      get messagetypes_path
      expect(response.status).to be(200)
    end
  end
end
