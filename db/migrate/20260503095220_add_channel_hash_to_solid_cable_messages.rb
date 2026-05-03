class AddChannelHashToSolidCableMessages < ActiveRecord::Migration[8.1]
  def change
    add_column :solid_cable_messages, :channel_hash, :integer, limit: 8, null: false
    add_index :solid_cable_messages, :channel_hash
  end
end
