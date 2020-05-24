FactoryBot.define do
  factory :question do
    association :test
    sequence(:label)          { |n| "Label #{n}" }
    sequence(:description)    { |n| Faker::Lorem.sentence }
  end
end
