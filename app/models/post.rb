class Post < ApplicationRecord
  belongs_to :user
  belongs_to :introduced_user, class_name: 'User'
end
