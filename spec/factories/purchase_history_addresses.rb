FactoryBot.define do
  factory :purchase_history_address do
    postal_code {'123-4567'}
    prefecture_id{ Faker::Number.between(from: 2, to: 48)}
    city{'八戸市'}
    address{'1-1'}
    building_name
    phone_number {'09012345678'}
    token {'tok_abcdefghijk00000000000000000'}
  end
end
