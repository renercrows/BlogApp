class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user
  after_save :update_posts_counter

  def recent_comments
    comments.last(5)
  end

  private

  def update_posts_counter
    user.update(posts_counter: user.posts.length)
  end
end
