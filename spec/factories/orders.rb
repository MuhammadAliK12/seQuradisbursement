FactoryBot.define do
  factory :order do
    merchant { nil }
    amount_cents { "30000" }
    is_disbursed {  false  }
    created_at   {  DateTime.now - 1.day  }
  end
end
