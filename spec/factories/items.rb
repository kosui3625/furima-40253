FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 2)}
    price                 { "500" }
    comment               {"test"}
    category_id           { "2" }
    item_explain_id       { "3" }
    prefecture_id         { "4" }
    postage_id            { "2"}
    take_id               { "3" }
    user                  {create (:user)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

