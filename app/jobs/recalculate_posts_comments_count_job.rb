class RecalculatePostsCommentsCountJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Post.left_joins(:comments)
        .select(posts: %i[id user_id], 'COUNT(comments)' => :comments_count)
        .group(posts: :id)
        .find_in_batches(batch_size: 5_000) do |posts_batch| 
      Post.upsert_all(posts_batch, update_only: :comments_count)
    end
  end
end
