class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  has_many :likes, dependent: :delete_all
  has_many :replies, dependent: :delete_all
end
