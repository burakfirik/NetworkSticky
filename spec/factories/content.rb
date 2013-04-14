FactoryGirl.define do
  factory :content do
    description Faker::Lorem.paragraphs(1)
  end
end
