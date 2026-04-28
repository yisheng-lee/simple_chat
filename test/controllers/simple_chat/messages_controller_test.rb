require "test_helper"

module SimpleChat
  class MessagesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @message = simple_chat_messages(:one)
    end

    test "should get index" do
      get messages_url
      assert_response :success
    end

    test "should get new" do
      get new_message_url
      assert_response :success
    end

    test "should create message" do
      assert_difference("Message.count") do
        post messages_url, params: { message: { chat_room_id: @message.chat_room_id, content: @message.content } }
      end

      assert_redirected_to message_url(Message.last)
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
      patch message_url(@message), params: { message: { chat_room_id: @message.chat_room_id, content: @message.content } }
      assert_redirected_to message_url(@message)
    end

    test "should destroy message" do
      assert_difference("Message.count", -1) do
        delete message_url(@message)
      end

      assert_redirected_to messages_url
    end
  end
end
