FactoryGirl.define do
  factory :election do
    name { Faker::Lorem.sentence.titleize }
    description{ Faker::Lorem.paragraph }
  end
end
