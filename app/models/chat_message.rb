class ChatMessage < ApplicationRecord
  belongs_to :chat, counter_cache: :messages_count
  belongs_to :user

  after_create :broadcast_message

   def broadcast_message
    ChatMessagesChannel.broadcast_to(
      ChatMessage, 
      { message: 'chat_message created', 
        id: id,
        chat_id: chat_id }
    )
  end
end
