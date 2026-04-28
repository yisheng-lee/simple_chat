class CreateSimpleChatChatMembers < ActiveRecord::Migration[8.1]
  def change
    create_table :simple_chat_chat_members do |t|
      t.references :chat_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
