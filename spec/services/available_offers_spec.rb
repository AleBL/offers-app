require "rails_helper"

RSpec.describe AvailableOffers do
  describe "available offers" do
    let!(:offer_expired) { create(:offer_expired) }
    let!(:offer_one) { create(:offer) }
    let!(:offer_two) { create(:offer) }
    
    context "get all offers still active" do
      it "must contain valid offers" do
        available_offers = subject.available_offers

        expect(available_offers).to include(offer_one, offer_two)
      end

      it "must not contain invalid offers" do
        available_offers = subject.available_offers

        expect(available_offers).to_not include(offer_expired)
      end
    end
  end
end