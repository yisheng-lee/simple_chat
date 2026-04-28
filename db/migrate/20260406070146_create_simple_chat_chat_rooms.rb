class CreateSimpleChatChatRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :simple_chat_chat_rooms do |t|
      t.string :title

      t.timestamps
    end
  end
end
