FactoryBot.define do
  factory :user do
    email     { FFaker::Internet.email }
    password  { FFaker::Internet.password }
    admin     { true }
  end

  factory :admin, class: 'User' do
    email     { FFaker::Internet.email }
    password  { FFaker::Internet.password }
  end
end