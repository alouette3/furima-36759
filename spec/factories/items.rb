FactoryBot.define do
  factory :item do
    name              {Faker::Name.initials(number: 2)}
    description       {'あいうえお'}
    price             {'2000'}
    item_condition_id    {'2'}
    delivery_charge_id   {'2'}
    delivery_day_id      {'2'}
    prefecture_id        {'2'}
    category_id          {'2'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
