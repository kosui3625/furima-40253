class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_explain
  belongs_to :postage_id
  belongs_to :prefecture_id
  belongs_to :take_id

  has_one_attached :image

  validates :content, presence: true
  validates :sell_price, presence: true
  validates :title, :text, presence: true


  validates :sell_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :sell_price, format: { with: /\A[0-9]+\z/}

  validates :category_id, numericality: { other_than: 1 } 
  validates :item_explain_id, numericality: { other_than: 1 } 
  validates :postage_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :take_id, numericality: { other_than: 1 } 
end
