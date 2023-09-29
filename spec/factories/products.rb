FactoryBot.define do
  factory :product do
    user
    name { 'New product name' }
  end
end
