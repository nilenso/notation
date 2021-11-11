FactoryBot.define do
  factory :user do
    name { "John" }
    email { "john#{rand(100)}@email.com" }
    password { "password" }
  end
end
