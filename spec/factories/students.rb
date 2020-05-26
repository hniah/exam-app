FactoryBot.define do
  factory :student do
    sequence(:name)     { |n| "Student #{n}" }
    sequence(:email)    { |n| "student#{n}@example.com" }
    password            { '123123123' }
    type                { 'Student' }
    api_token           { '123123123' }
  end
end