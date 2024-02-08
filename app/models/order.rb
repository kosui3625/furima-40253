class Order
  include ActiveModel::Model
  attr_accessor :add_number, :prefecture_id, :city, :home_number, :building_name, :phone_number, :item_id, :user_id, :token



  with_options presence: true do
    validates :add_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, presence: true
    validates :home_number, presence: true
    validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/, message: 'is invalid. Input half-width characters.'}
    validates :token, presence: true
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :user_id, presence: true
    validates :item_id, presence: true

  end


  def save
    pay = Pay.create(user_id: user_id, item_id: item_id)
    Address.create(add_number: add_number, prefecture_id: prefecture_id, city: city, home_number: home_number, building_name: building_name, phone_number: phone_number)
  end
end
