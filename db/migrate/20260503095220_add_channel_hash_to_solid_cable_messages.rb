class AddChannelHashToSolidCableMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :solid_cable_messages do |t|
      t.binary :channel, null: false, limit: 1024
      t.binary :payload, null: false, limit: 536870912
      t.integer :solid_cable_messages, :channel_hash, limit: 8, null: false
      t.datetime :created_at, null: false

      t.index :channel
      t.index :created_at
    end
    add_index :solid_cable_messages, :channel_hash
  end
end
