require 'rails_helper'

RSpec.describe "offers/index", type: :view do
  before { assign(:offers, [create(:offer)]) }

  it "renders a list of offers" do
    render

    assert_select "b", text: Offer.last.advertiser_name, count: 1
    assert_select "b", text: Offer.last.url, count: 1
    assert_select "p", text: Offer.last.description, count: 1
    assert_select "p", text: "Starts: " + Offer.last.starts_at.to_s, count: 1
    assert_select "p", text: "Ends: " + Offer.last.ends_at.to_s, count: 1
    assert_select "p", text: "Offer Disable", count: 1
    assert_select "button", text: "New Offer", count: 1
    assert_select "form", count: 1
    assert_select "div>a", text: "Edit", count: 1
    assert_select "div>a", text: "Destroy", count: 1
  end
end
