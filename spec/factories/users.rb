FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'a1'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {'あ一ア'}
    first_name {'い二イ'}
    family_name_kana {'マイケル'}
    first_name_kana {'ジャクソン'}
    birth_day {'1984-07-23'}
  end
end