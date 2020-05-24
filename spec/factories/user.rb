FactoryBot.define do
  factory :user do
    sequence(:name)       { |n| "User #{n}" }
    sequence(:email)      { |n| "user#{n}@example.com" }
    password              { '123123123' }

    trait :random_role do
      type { User::ROLE.sample }
    end

    trait :student do
      type { 'Student' }
    end

    trait :teacher do
      type { 'Teacher' }
    end
  end
end
