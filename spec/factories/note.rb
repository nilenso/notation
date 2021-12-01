FactoryBot.define do
  factory :note do
    user
    title { "My Note" }
    body { "This is my new note." }
  end
end
