require "test_helper"

module SimpleChat
  class MessagesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @chat_room = simple_chat_chat_rooms(:one)
      @message = simple_chat_messages(:one)
      # Ensure user is a member for message creation tests
      @chat_room.chat_members.find_or_create_by!(user_id: User.first.id)
    end

    test "should get index" do
      get messages_url(chat_room_id: @chat_room.id)
      assert_response :success
    end

    test "should get new" do
      get new_message_url(chat_room_id: @chat_room.id)
      assert_response :success
    end

    test "should create message" do
      assert_difference("Message.count") do
        post messages_url, params: { message: { content: @message.content, chat_room_id: @chat_room.id } }
      end

      assert_redirected_to chat_room_url(@chat_room)
      assert_equal User.first.id, Message.last.user_id
    end

    test "should show message" do
      get message_url(@message)
      assert_response :success
    end

    test "should get edit" do
      get edit_message_url(@message)
      assert_response :success
    end

    test "should update message" do
      patch message_url(@message), params: { message: { content: @message.content } }
      assert_redirected_to message_url(@message)
    end

    test "should destroy message" do
      assert_difference("Message.count", -1) do
        delete message_url(@message)
      end

      assert_redirected_to messages_url(chat_room_id: @chat_room.id)
    end
    test "should not create message if not a member" do
      @chat_room.chat_members.where(user_id: User.first.id).destroy_all
      assert_no_difference("Message.count") do
        post messages_url, params: { message: { content: @message.content, chat_room_id: @chat_room.id } }
      end

      assert_redirected_to chat_room_url(@chat_room)
      assert_equal "You must be a member of this chat room to post messages.", flash[:alert]
    end
  end
end
