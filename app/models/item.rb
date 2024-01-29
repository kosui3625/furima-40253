class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_explain
  belongs_to :postage_id
  belongs_to :prefecture_id
  belongs_to :take_id

  has_one_attached :image

  validates :content, presence: true

  validates :title, :text, presence: true


  validates :category_id, numericality: { other_than: 1 } 
  validates :item_explain_id, numericality: { other_than: 1 } 
  validates :postage_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :take_id, numericality: { other_than: 1 } 
end
