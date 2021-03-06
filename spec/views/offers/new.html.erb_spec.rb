require 'rails_helper'

RSpec.describe "offers/new", type: :view do
  before { assign(:offer, build(:offer)) }

  it "renders new offer form" do
    render

    assert_select "form[action=?][method=?]", offers_path, "post" do
      assert_select "input[name=?]", "offer[advertiser_name]"
      assert_select "input[name=?]", "offer[url]"
      assert_select "textarea[name=?]", "offer[description]"
      assert_select "input[name=?]", "offer[premium]"
    end
  end
end
