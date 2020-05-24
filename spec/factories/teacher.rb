FactoryBot.define do
  factory :teacher do
    sequence(:name)     { |n| "Teacher #{n}" }
    sequence(:email)    { |n| "teacher#{n}@example.com" }
    password            { '123123123' }
    type                { 'Teacher' }
  end
end
