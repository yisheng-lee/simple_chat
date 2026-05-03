require "test_helper"

class SimpleChatTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert SimpleChat::VERSION
  end

  test "create_chat creates a chat room with two members as arguments" do
    user1 = users(:one)
    user2 = users(:two)

    assert_difference "SimpleChat::ChatRoom.count", 1 do
      assert_difference "SimpleChat::ChatMember.count", 2 do
        SimpleChat.create_chat(user1, user2)
      end
    end

    chat_room = SimpleChat::ChatRoom.last
    assert_equal "Chat between #{user1.name} and #{user2.name}", chat_room.title
    assert chat_room.is_member?(user1)
    assert chat_room.is_member?(user2)
  end

  test "create_chat creates a chat room with two members as an array" do
    user1 = users(:one)
    user2 = users(:two)

    assert_difference "SimpleChat::ChatRoom.count", 1 do
      assert_difference "SimpleChat::ChatMember.count", 2 do
        SimpleChat.create_chat([user1, user2])
      end
    end

    chat_room = SimpleChat::ChatRoom.last
    assert_equal "Chat between #{user1.name} and #{user2.name}", chat_room.title
  end

  test "create_chat creates a chat room with multiple members" do
    user1 = users(:one)
    user2 = users(:two)
    user3 = User.create!(name: "Three")

    assert_difference "SimpleChat::ChatRoom.count", 1 do
      assert_difference "SimpleChat::ChatMember.count", 3 do
        SimpleChat.create_chat([user1, user2, user3])
      end
    end

    chat_room = SimpleChat::ChatRoom.last
    assert_equal "Chat between #{user1.name}, #{user2.name} and #{user3.name}", chat_room.title
  end

  test "create_chat creates a chat room with custom title" do
    user1 = users(:one)
    user2 = users(:two)
    title = "Custom Title"

    chat_room = SimpleChat.create_chat([user1, user2], title: title)
    assert_equal title, chat_room.title
  end
end
