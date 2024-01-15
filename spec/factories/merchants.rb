FactoryBot.define do
  factory :merchant do
    email { Faker::Internet.email }
    live_on { "2024-01-12" }
    disbursement_frequency { "DAILY" }
  end
end
