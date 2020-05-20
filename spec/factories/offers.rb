FactoryBot.define do
  factory :offer do
    advertiser_name { FFaker::Company.name }
    url { FFaker::Internet.http_url }
    description { FFaker::Lorem.characters(255) }
    starts_at { Date.current }
    ends_at { Date.tomorrow }
    premium { false }
  end

  factory :offer_premium, class: 'Offer' do
    advertiser_name { FFaker::Company.name }
    url { FFaker::Internet.http_url }
    description { FFaker::Lorem.characters(255) }
    starts_at { Date.current }
    ends_at { Date.tomorrow }
    premium { true }
  end

  factory :offer_with_url_invalid, class: 'Offer' do
    advertiser_name { FFaker::Company.name }
    url { FFaker::Company.name }
    description { FFaker::Lorem.characters(255) }
    starts_at { Date.current }
    ends_at { Date.tomorrow }
    premium { true }
  end

  factory :offer_without_advertiser_name, class: 'Offer' do
    url { FFaker::Internet.http_url }
    description { FFaker::Lorem.characters(255) }
    starts_at { Date.current }
    ends_at { Date.tomorrow }
    premium { true }
  end

  factory :offer_expired, class: 'Offer' do
    advertiser_name { FFaker::Company.name }
    url { FFaker::Company.name }
    description { FFaker::Lorem.characters(255) }
    starts_at { Date.current }
    ends_at { Date.yesterday }
  end
end
