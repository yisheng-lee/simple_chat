class CreateSimpleChatMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :simple_chat_messages do |t|
      t.references :chat_room, null: false, foreign_key: { to_table: :simple_chat_chat_rooms }
      t.integer :user_id, null: false
      t.text :content

      t.timestamps
    end
    add_index :simple_chat_messages, :user_id
  end
end
