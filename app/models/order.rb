class orders
  include ActiveModel::Model
  attr_accessor :add_number, :prefecture_id, :city, :home_number, :building_name, :phone_number, :item, :user

  with_options presence: true do
    validates :add_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, presence: true
    validates :home_number, presence: true
    validates :phone_number, presence: true,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  end
  validates :prefecture_id, numericality: { other_than: 1 } 
end
