FactoryGirl.define do
  factory :election do
    title { Faker::Lorem.sentence.titleize }
    description{ Faker::Lorem.paragraph }
  end
end
