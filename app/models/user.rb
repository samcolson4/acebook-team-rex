class User < ApplicationRecord
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6, maximum: 10 }
end
