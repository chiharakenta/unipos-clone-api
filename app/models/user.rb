class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :introducings, through: :posts, source: :introduced_user

  has_many :reverses_of_introduce, class_name: 'Post', foreign_key: 'introduced_user_id'
  has_many :introducer, through: :reverses_of_introduce, source: :user
end
