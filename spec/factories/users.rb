FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {'Jackson'}
    first_name {'Michael'}
    family_name_kana {'マイケル'}
    first_name_kana {'ジャクソン'}
    birth_day {'1984-07-23'}
  end
end