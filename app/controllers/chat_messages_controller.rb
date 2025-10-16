class ChatMessagesController < ApplicationController
  before_action :set_chat_and_chat_messages, only: %i[index create]

  # GET /chat_messages or /chat_messages.json
  def index
    add_breadcrumb "чаты", chats_path
    add_breadcrumb @chat.name, chat_messages_path(@chat)
  end

  # POST /chat_messages or /chat_messages.json
  def create
    @chat_message = ChatMessage.new(chat_message_params)
    @chat_message.user = Current.user

    respond_to do |format|
      if @chat_message.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat_message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_chat_and_chat_messages 
      @chat = Chat.find(params[:chat_id])
      @chat_messages = @chat.messages.includes(:user)
    end

    # Only allow a list of trusted parameters through.
    def chat_message_params
      params.expect(chat_message: [ :chat_id, :content ])
    end
end
