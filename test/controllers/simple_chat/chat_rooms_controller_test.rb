require "test_helper"

module SimpleChat
  class ChatRoomsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @chat_room = simple_chat_chat_rooms(:one)
    end

    test "should get index and show only member rooms" do
      # Create a room the user is NOT a member of
      other_room = ChatRoom.create!(title: "Other Room")
      
      # Ensure user is member of @chat_room (it is in fixtures, but let's be sure)
      @chat_room.chat_members.find_or_create_by!(user_id: User.first.id)

      get chat_rooms_url
      assert_response :success
      assert_select "div#chat_rooms" do
        assert_select "div", text: /#{@chat_room.title}/
        assert_select "div", text: /#{other_room.title}/, count: 0
      end
    end

    test "should get new" do
      get new_chat_room_url
      assert_response :success
    end

    test "should create chat_room" do
      assert_difference("ChatRoom.count") do
        post chat_rooms_url, params: { chat_room: { title: "New Unique Title" } }
      end

      assert_redirected_to chat_room_url(ChatRoom.last)
    end

    test "should show chat_room when member" do
      @chat_room.chat_members.find_or_create_by!(user_id: User.first.id)
      get chat_room_url(@chat_room)
      assert_response :success
    end

    test "should redirect show when not member and show alert" do
      @chat_room.chat_members.where(user_id: User.first.id).destroy_all
      get chat_room_url(@chat_room)
      assert_redirected_to chat_rooms_url
      assert_equal "You are not a member of this chat room.", flash[:alert]
      
      follow_redirect!
      assert_select "p", text: "You are not a member of this chat room."
    end

    test "should get edit when member" do
      @chat_room.chat_members.find_or_create_by!(user_id: User.first.id)
      get edit_chat_room_url(@chat_room)
      assert_response :success
    end

    test "should update chat_room when member" do
      @chat_room.chat_members.find_or_create_by!(user_id: User.first.id)
      patch chat_room_url(@chat_room), params: { chat_room: { title: "Updated Title" } }
      assert_redirected_to chat_room_url(@chat_room)
    end

    test "should destroy chat_room when member" do
      @chat_room.chat_members.find_or_create_by!(user_id: User.first.id)
      assert_difference("ChatRoom.count", -1) do
        delete chat_room_url(@chat_room)
      end

      assert_redirected_to chat_rooms_url
    end
  end
end
