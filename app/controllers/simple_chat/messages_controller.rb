module SimpleChat
  class MessagesController < ApplicationController
    before_action :set_message, only: %i[ show edit update destroy ]

    # GET /messages
    def index
      if params[:chat_room_id]
        @chat_room = ChatRoom.find(params[:chat_room_id])
        @messages = @chat_room.messages
      else
        @messages = Message.all
      end
    end

    # GET /messages/1
    def show
    end

    # GET /messages/new
    def new
      @message = Message.new(chat_room_id: params[:chat_room_id])
      @chat_room = @message.chat_room
    end

    # GET /messages/1/edit
    def edit
    end

    # POST /messages
    def create
      @message = Message.new(message_params)
      @message.user = simple_chat_current_user
      @chat_room = @message.chat_room

      if @message.save
        redirect_to @chat_room || @message, notice: "Message was successfully created."
      else
        render :new, status: :unprocessable_content
      end
    end

    # PATCH/PUT /messages/1
    def update
      if @message.update(message_params)
        redirect_to @message, notice: "Message was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_content
      end
    end

    # DELETE /messages/1
    def destroy
      chat_room = @message.chat_room
      @message.destroy!
      redirect_to messages_path(chat_room_id: chat_room&.id), notice: "Message was successfully destroyed.", status: :see_other
    end

    private
      def set_message
        @message = Message.find(params[:id])
        @chat_room = @message.chat_room
      end

      # Only allow a list of trusted parameters through.
      def message_params
        params.expect(message: [ :content, :chat_room_id ])
      end
  end
end
