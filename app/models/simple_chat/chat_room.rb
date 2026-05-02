module SimpleChat
  class ChatRoom < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :chat_members, dependent: :destroy
    validates :title, uniqueness: true

    private
    def is_group_chat
      chat_members.count > 2
    end

    def last_message_id
      messages.last.id
    end
  end
end
