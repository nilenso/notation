FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryBot.define do
  factory :user do
    name { "John" }
    email { generate :email }
    password { "password" }
  end
end
