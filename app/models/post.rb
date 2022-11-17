class Post < ApplicationRecord
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy
  belongs_to :user
  after_save :update_posts_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.last(5)
  end

  private

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end
end
