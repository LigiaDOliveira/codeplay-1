FactoryBot.define do
  factory :enrollment do
    student
    course
    price { 10 }
  end
end
