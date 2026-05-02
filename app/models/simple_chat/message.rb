module SimpleChat
  class Message < ApplicationRecord
    belongs_to :chat_room
    belongs_to :user, class_name: SimpleChat.configuration.chat_user_model
  end
end
