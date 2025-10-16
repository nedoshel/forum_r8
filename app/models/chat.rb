class Chat < ApplicationRecord
  has_many :messages, class_name: 'ChatMessage', dependent: :delete_all
end
