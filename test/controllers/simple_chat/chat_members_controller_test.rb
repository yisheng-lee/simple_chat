require "test_helper"

module SimpleChat
  class ChatMembersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @chat_room = simple_chat_chat_rooms(:one)
      @user = User.first
    end

    test "should join chat room" do
      @chat_room.chat_members.where(user_id: @user.id).destroy_all
      
      assert_difference("@chat_room.chat_members.count") do
        post chat_room_chat_members_url(@chat_room)
      end

      assert_redirected_to chat_room_url(@chat_room)
      assert_equal "You are now a member of this chat room.", flash[:notice]
    end

    test "should leave chat room" do
      @chat_room.chat_members.find_or_create_by!(user_id: @user.id)

      assert_difference("@chat_room.chat_members.count", -1) do
        delete chat_room_chat_member_url(@chat_room, "current")
      end

      assert_redirected_to chat_rooms_url
      assert_equal "You have left the chat room.", flash[:notice]
    end
  end
end
