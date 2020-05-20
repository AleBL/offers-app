class HomeController < ApplicationController
  def index
    @offers = AvailableOffers.new.available_offers
  end
end
