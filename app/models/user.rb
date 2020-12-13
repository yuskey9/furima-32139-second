class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  password_regex = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: password_regex, message: 'please set including both letters and numbers.'

  with_options presence: true do
    validates :nickname, :birth_date
  end

  with_options presence: true do
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "It is invalid. Please enter the user's real name in full-width." }
    # 全角ひらがな、全角カタカナ、漢字のバリデーション
  end

  with_options presence: true do
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "It is invalid. Please enter the user's real name in full-width katakana." }
    # 全角カタカナのバリデーション
  end

  has_many :items
  has_many :orders
end
