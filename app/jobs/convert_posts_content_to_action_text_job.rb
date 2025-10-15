class ConvertPostsContentToActionTextJob < ApplicationJob
  queue_as :default

  def perform
    Post.find_each do |post| 
      post.update(content: post.attributes['content'])
    end
  end
end
