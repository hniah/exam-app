FactoryBot.define do
  factory :student do
    sequence(:name)     { |n| "Student #{n}" }
    sequence(:email)    { |n| "student#{n}@example.com" }
    password            { '123123123' }
    type                { 'Student' }

    trait :token do
      api_token { 'access-token' }
    end
  end
end