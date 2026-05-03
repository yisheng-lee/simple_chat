module SimpleChat
  class ChatRoom < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :chat_members, dependent: :destroy
    validates :title, uniqueness: true

    scope :for_user, ->(user) { joins(:chat_members).where(simple_chat_chat_members: { user_id: user.id }) }

    def is_member?(user)
      chat_members.exists?(user: user)
    end

    private
    def is_group_chat
      chat_members.count > 2
    end

    def last_message_id
      messages.last.id
    end
  end
end
