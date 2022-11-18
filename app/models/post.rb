class Post < ApplicationRecord
  has_many :comment
  has_many :like
  belongs_to :user
  after_save :posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_comment
    comment.last(5)
  end

  private

  def posts_counter
    user.increment!(:posts_counter)
  end
end
