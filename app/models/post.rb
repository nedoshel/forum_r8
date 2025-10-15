class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all

   # for RecalculatePostsCommentsCountJob
  delegate :stringify_keys, to: :attributes

  after_update_commit :clear_cache

  def clear_cache
    Rails.cache.clear
  end
end
