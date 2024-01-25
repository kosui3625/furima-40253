FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    family_name           {'アイウ'}
    first_name            {'ウイア'}
    family_name_hiragana  {'アイエ'}
    first_name_hiragana   {'エイア'}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    birth                 { Faker::Date.birthday(min_age: 18, max_age: 65)}
    trait :invalid_password1 do
      password { "パスワード＠＠１２３" }
    end
    trait :invalid_password2 do
      password { Faker::Lorem.characters(number: 10, min_alpha: 10, max_alpha: 10) }
    end
    trait :invalid_password3 do
      password { Faker::Number.number(digits: 10) }
    end
  end
end
