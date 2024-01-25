FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    family_name           {'アイウ'}
    first_name            {'ウイア'}
    family_name_hiragana  {'アイエ'}
    first_name_hiragana   {'エイア'}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth                 { Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
