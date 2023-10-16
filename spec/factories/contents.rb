FactoryBot.define do
  factory :content do
    product { nil }
    name { Faker::Book.title }
    description { Faker::Book.genre }
  end
end
