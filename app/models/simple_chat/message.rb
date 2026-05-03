module SimpleChat
  class Message < ApplicationRecord
    belongs_to :chat_room
    belongs_to :user, class_name: SimpleChat.configuration.chat_user_model

    after_create_commit -> { broadcast_append_later_to "simple_chat", chat_room, target: "messages_list", partial: "simple_chat/messages/message", locals: { message: self } }
  end
end
