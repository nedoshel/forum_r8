class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all

   # for RecalculatePostsCommentsCountJob
  delegate :stringify_keys, to: :attributes

  after_update_commit :broadcast_message

  has_rich_text :content

  def broadcast_message
    PostsChannel.broadcast_to(
      Post, 
      { message: 'post updated', 
        id: id, 
        html: ApplicationController.render(partial: 'posts/post', locals: { post: self, html_tag: 'li' }) }
    )
  end
end
