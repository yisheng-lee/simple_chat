# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_06_081003) do
  create_table "simple_chat_chat_members", force: :cascade do |t|
    t.integer "chat_room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_simple_chat_chat_members_on_chat_room_id"
  end

  create_table "simple_chat_chat_rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "simple_chat_messages", force: :cascade do |t|
    t.integer "chat_room_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_simple_chat_messages_on_chat_room_id"
  end

  add_foreign_key "simple_chat_chat_members", "chat_rooms"
  add_foreign_key "simple_chat_messages", "chat_rooms"
end
