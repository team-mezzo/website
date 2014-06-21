require 'rails_helper'

RSpec.describe "DonationOffers", :type => :request do
  describe "GET /donation_offers" do
    it "works! (now write some real specs)" do
      get donation_offers_path
      expect(response.status).to be(200)
    end
  end
end
