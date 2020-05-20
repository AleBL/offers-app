# Admin
admin = User.new(email: 'admin@email.com', password: 'admin@email.com', admin: true)
admin.save

# User
user = User.new(email: 'user@email.com', password: 'user@email.com')
user.save

# Offer
amazon_offer = Offer.new(advertiser_name: "Amazon", url: "https://www.amazon.com/", 
description: "Lorem ipsum is simply dummy text of the printing and typesetting industry. lorem ipsum has been the industry's standard dummy text
ver since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
premium: true, starts_at: Date.current, ends_at: Date.current)
amazon_offer.save

netflix_offer = Offer.new(advertiser_name: "Netflix", url: "https://www.netflix.com", 
description: "Lorem ipsum is simply dummy text of the printing and typesetting industry. lorem ipsum has been the industry's standard dummy text
ver since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
premium: true, starts_at: Date.current, ends_at: Date.current)
netflix_offer.save
