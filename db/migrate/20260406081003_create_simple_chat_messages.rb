class CreateSimpleChatMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :simple_chat_messages do |t|
      t.references :chat_room, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
