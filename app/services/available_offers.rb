class AvailableOffers
  def available_offers
    update_status

    @offers = Offer.where(enable: true).order(premium: :desc)
  end

  private 

  def update_status
    enable_offers = active_offers
    all_offers = Offer.all

    all_offers.each do |offer|
      offer.enable = enable_offers.include?(offer)
      offer.save!
    end
  end

  def active_offers
    @active_offers = Offer.where("starts_at <= :date", date: Date.current.beginning_of_day)
                          .where("ends_at >= :date", date: Date.current.end_of_day)
  end
end
