FactoryGirl.define do
  factory :option do
    name { Faker::Lorem.sentence }
  end
end
