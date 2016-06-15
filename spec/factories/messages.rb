FactoryGirl.define do
  factory :message do
    body { Faker::Lorem.words(rand(2..10)) }
  end
end
