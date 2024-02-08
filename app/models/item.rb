class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_explain
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :take
  belongs_to :user

  has_one_attached :image
  has_one :pay


  validates :comment, presence: true
  validates :price, presence: true
  validates :name, presence: true
  validates :image, presence: true


  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

  validates :category_id, numericality: { other_than: 1 } 
  validates :item_explain_id, numericality: { other_than: 1 } 
  validates :postage_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :take_id, numericality: { other_than: 1 } 
end
