FactoryGirl.define do
  factory :responder do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    campaign
  end
end
