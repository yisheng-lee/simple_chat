require "test_helper"

module SimpleChat
  class MessageTest < ActiveSupport::TestCase
    setup do
      @chat_room = simple_chat_chat_rooms(:one)
    end

    test "message belongs to user" do
      user = User.first
      message = @chat_room.messages.create!(content: "test", user: user)
      assert_not_nil message.user, "Message should have a user"
      assert_instance_of User, message.user
    end
  end
end
