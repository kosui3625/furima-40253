class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  validates :title, :text, presence: true


  validates :genre_id, numericality: { other_than: 1 } 

end
