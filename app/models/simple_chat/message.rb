module SimpleChat
  class Message < ApplicationRecord
    belongs_to :chat_room
    belongs_to :user, class_name: SimpleChat.configuration.chat_user_model

    after_create_commit :broadcast_to_members

    private

    def broadcast_to_members
      chat_room.chat_members.each do |chat_member|
        broadcast_append_later_to(
          "simple_chat", chat_room, chat_member.user,
          target: "messages_list",
          partial: "simple_chat/messages/message",
          locals: { message: self, current_user: chat_member.user }
        )
      end
    end
  end
end
