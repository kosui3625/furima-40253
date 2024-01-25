class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_hiragana, presence: true
  validates :first_name_hiragana, presence: true
  validates :birth, presence: true

  validates :family_name_hiragana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_hiragana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯々ー]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯々ー]+\z/}
  validates :password, format: { without: /[^ -~｡-ﾟ]+/ }
  validates :password_confirmation, format: { without: /[^ -~｡-ﾟ]+/ }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :email, presence: true, uniqueness: true


end

