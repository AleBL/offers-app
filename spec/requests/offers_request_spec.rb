require 'rails_helper'

RSpec.describe "Offers", type: :request do
  let(:valid_attributes) { attributes_for(:offer) }
  let(:invalid_attributes) { attributes_for(:offer_with_url_invalid) }

  let(:admin) { create(:admin) }
  
  before { sign_in admin }

  describe "GET /new" do
    it "renders a successful response" do
      get new_offer_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:offer) { create(:offer) }
    it "render a successful response" do
      get edit_offer_url(offer)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Offer" do
        expect {
          post offers_url, params: { offer: valid_attributes }
        }.to change(Offer, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Offer" do
        expect {
          post offers_url, params: { offer: invalid_attributes }
        }.to change(Offer, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post offers_url, params: { offer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:offer) { create(:offer) }
      let(:new_attributes) {
        {
          advertiser_name: FFaker::Company.name,
          url: FFaker::Internet.http_url,
          description: FFaker::Lorem.characters(255),
          starts_at: Date.current,
          ends_at: Date.tomorrow,
          premium: false
        }
      }

      it "return correct http response" do
        patch offer_url(offer), params: { offer: new_attributes }
        expect(response).to have_http_status(302)
      end
    end

    context "with invalid parameters" do
      let(:offer) { create(:offer) }
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch offer_url(offer), params: { offer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:offer) { create(:offer) }

    it "destroys the requested offer" do
      expect {
        delete offer_url(offer)
      }.to change(Offer, :count).by(-1)
    end

    it "redirects to the offers list" do
      delete offer_url(offer)
      expect(response).to redirect_to(offers_url)
    end
  end
end
