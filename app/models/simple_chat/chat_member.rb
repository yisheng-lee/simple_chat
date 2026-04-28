module SimpleChat
  class ChatMember < ApplicationRecord
    belongs_to :chat_room
  end
end
