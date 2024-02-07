FactoryBot.define do
  factory :order do
    add_number            { '123-4567' }
    prefecture_id         { 2 }
    city                  { '東京都' }
    home_number           { '1-1' }
    building_name         { '東京ハイツ' }
    phone_number          {'00012345678'}

  end
end
