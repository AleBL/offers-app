require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe 'validations' do
    let(:subject) { build(:offer) }
    
    it { should validate_presence_of(:advertiser_name) }
    it { should validate_uniqueness_of(:advertiser_name) }

    it { should validate_presence_of(:url) }

    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description)
          .is_at_most(500)
          .with_long_message('500 characters is the maximum allowed') }

    it { should validate_presence_of(:starts_at) }
  end

  context "Valid Offer" do
    let(:offer) { build(:offer) }

    it "It is a valid offer" do
      expect(offer.valid?).to be_truthy
    end
  end

  context "Invalid Offer" do
    let(:offer_with_url_invalid)        { build(:offer_with_url_invalid) }
    let(:offer_without_advertiser_name) { build(:offer_without_advertiser_name) }

    it "It is not a valid offer, url is not valid " do
      expect(offer_with_url_invalid.valid?).to be_falsy
    end

    it "It is not a valid offer, offer doesn`t have an advertiser name" do
      expect(offer_without_advertiser_name.valid?).to be_falsy
    end
  end
end
