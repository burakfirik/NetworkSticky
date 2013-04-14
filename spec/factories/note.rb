FactoryGirl.define do
  factory :note do
    name Faker::Lorem.words(5)
  end
end
