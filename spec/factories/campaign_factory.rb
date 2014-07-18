FactoryGirl.define do
  factory :campaign do
    title { Faker::Lorem.sentence.titleize }
    description{ Faker::Lorem.paragraph }
  end
end
