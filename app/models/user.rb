class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  has_many :gossips, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :replies, dependent: :delete_all
  has_many :likes, dependent: :delete_all
end
