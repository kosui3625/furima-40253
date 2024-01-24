class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_hiragana, presence: true
  validates :first_name_hiragana, presence: true
  validates :birth, presence: true

  validates :password, presence: true, length: { minimum: 6}, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "は半角英数字混合で入力してください" 
  validates :family_name_hiragana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角（カタカナ）で入力してください" }
  validates :first_name_hiragana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角（カタカナ）で入力してください" }
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯々ー]+\z/, message: "は全角の漢字・ひらがな・カタカナで入力してください" }

end
