require "test_helper"

module SimpleChat
  class MessageTest < ActiveSupport::TestCase
    test "message belongs to user" do
      message = simple_chat_messages(:one)
      puts "Message user_id: #{message.user_id.inspect}"
      puts "Message user: #{message.user.inspect}"
      puts "All Users count: #{User.count}"
      puts "First User ID: #{User.first&.id}"
      assert_not_nil message.user, "Message should have a user"
      assert_instance_of User, message.user
    end
  end
end
