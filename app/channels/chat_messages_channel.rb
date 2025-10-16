class ChatMessagesChannel < ApplicationCable::Channel
  def subscribed
    puts '-------------------------current_user: '
    puts current_user.inspect
    chat_message = ChatMessage.find_by(id: params[:id])

    chat_message ? stream_for(chat_message) : stream_for(ChatMessage)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
