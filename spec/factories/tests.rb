FactoryBot.define do
  factory :test do
    sequence(:name)         { |n| "Name #{n}" }
    sequence(:description)  { Faker::Lorem.sentence }
  end
end
