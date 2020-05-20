class Offer < ApplicationRecord
  validates :advertiser_name, presence: true
  validates :advertiser_name, uniqueness: true

  validates :url, presence: true
  validate :validate_url

  validates :description, presence: true
  validates :description, length: { 
    maximum: 500,
    too_long: "500 characters is the maximum allowed" 
  }

  validates :starts_at, presence: true

  def validate_url
    unless valid_url?
      errors.add(:url, "is not a valid HTTP URL")
    end
  end

  def valid_url?
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
end
