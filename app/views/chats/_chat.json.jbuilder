json.extract! chat, :id, :name, :messages_count, :created_at, :updated_at
json.url chat_url(chat, format: :json)
