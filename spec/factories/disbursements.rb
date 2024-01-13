FactoryBot.define do
  factory :disbursement do
    amount { "MyString" }
    sequra_fee { "MyString" }
    merchant { nil }
  end
end
