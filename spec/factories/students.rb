FactoryBot.define do
  factory :student do
    sequence(:email) { |n| "student#{n}@school.com" }
    password { '123456' }
  end
end
