class Order
  include ActiveModel::Model
  attr_accessor :add_number, :prefecture_id, :city, :home_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :add_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, presence: true
    validates :home_number, presence: true
    validates :phone_number, presence: true,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  end
  validates :prefecture_id, numericality: { other_than: 1 } 

  def save
    pay = Pay.create(price: price, user_id: user_id)
    Address.create(add_number: add_number, prefecture: prefecture, city: city, home_number: home_number, building_name: building_name, phone_number: phone_number)
  end
end
