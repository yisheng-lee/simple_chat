class CreateSimpleChatChatMembers < ActiveRecord::Migration[8.1]
  def change
    create_table :simple_chat_chat_members do |t|
      t.references :chat_room, null: false, foreign_key: { to_table: :simple_chat_chat_rooms }
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :simple_chat_chat_members, :user_id
  end
end
