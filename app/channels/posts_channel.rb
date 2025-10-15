class PostsChannel < ApplicationCable::Channel
  def subscribed
    post = Post.find_by(id: params[:id])

    post ? stream_for(post) : stream_for(Post)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
