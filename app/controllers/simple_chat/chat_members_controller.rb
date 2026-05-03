module SimpleChat
  class ChatMembersController < ApplicationController
    before_action :set_chat_room

    def create
      @chat_member = @chat_room.chat_members.find_or_initialize_by(user: simple_chat_current_user)

      if @chat_member.save
        redirect_to @chat_room, notice: "You are now a member of this chat room."
      else
        redirect_to @chat_room, alert: "Unable to join chat room."
      end
    end

    def destroy
      @chat_member = @chat_room.chat_members.find_by(user: simple_chat_current_user)
      @chat_member&.destroy
      redirect_to chat_rooms_path, notice: "You have left the chat room."
    end

    private

    def set_chat_room
      @chat_room = ChatRoom.find(params[:chat_room_id])
    end
  end
end
