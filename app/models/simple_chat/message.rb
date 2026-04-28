module SimpleChat
  class Message < ApplicationRecord
    belongs_to :chat_room
  end
end
