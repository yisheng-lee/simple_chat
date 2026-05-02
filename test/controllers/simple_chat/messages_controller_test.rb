require "test_helper"

module SimpleChat
  class MessagesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @chat_room = simple_chat_chat_rooms(:one)
      @message = simple_chat_messages(:one)
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
      user = User.first
      assert_difference("Message.count") do
        post messages_url, params: { message: { content: @message.content, user_id: user.id, chat_room_id: @chat_room.id } }
      end

      assert_redirected_to chat_room_url(@chat_room)
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
      user = User.first
      patch message_url(@message), params: { message: { content: @message.content, user_id: user.id } }
      assert_redirected_to message_url(@message)
    end

    test "should destroy message" do
      assert_difference("Message.count", -1) do
        delete message_url(@message)
      end

      assert_redirected_to messages_url(chat_room_id: @chat_room.id)
    end
  end
end
