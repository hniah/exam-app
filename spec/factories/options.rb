FactoryBot.define do
  factory :option do
    association :question
    sequence(:answer)         { |n| "Answer #{n}" }
    trait :correct_answer do
      correct { true }
    end
  end
end
