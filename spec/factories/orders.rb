FactoryBot.define do
  factory :order do
    add_number { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number {'000-1234-5678'}

  end
end
