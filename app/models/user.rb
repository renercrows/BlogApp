class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
