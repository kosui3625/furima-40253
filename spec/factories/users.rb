FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    family_name           { "田中" }
    first_name            { "太郎" }
    family_name_hiragana  { "タナカ" }
    first_name_hiragana   { "タロウ" }
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    birth                 { Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
