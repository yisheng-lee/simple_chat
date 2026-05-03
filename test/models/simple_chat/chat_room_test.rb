require "test_helper"

module SimpleChat
  class ChatRoomTest < ActiveSupport::TestCase
    test "is_member? returns true if user is a member" do
      chat_room = simple_chat_chat_rooms(:one)
      user = User.first
      chat_room.chat_members.create!(user: user)

      assert chat_room.is_member?(user)
    end

    test "is_member? returns false if user is not a member" do
      chat_room = simple_chat_chat_rooms(:two)
      user = User.first

      # Ensure user is not a member (might be in fixtures)
      chat_room.chat_members.where(user: user).destroy_all

      assert_not chat_room.is_member?(user)
    end
  end
end
