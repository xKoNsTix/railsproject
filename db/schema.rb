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

ActiveRecord::Schema[7.0].define(version: 2023_01_31_123659) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "room_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.boolean "alive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_users_on_room_id"
    t.index ["user_id"], name: "index_room_users_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.decimal "prizepool"
    t.boolean "finished"
    t.boolean "active"
    t.string "x_color"
    t.string "o_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "round_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "round_id", null: false
    t.boolean "x_decision"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_round_users_on_round_id"
    t.index ["user_id"], name: "index_round_users_on_user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "room_id", null: false
    t.decimal "round_number"
    t.boolean "finished"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "x_decision"
    t.index ["room_id"], name: "index_rounds_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.decimal "game_wins"
    t.decimal "games_played"
    t.decimal "rounds_played"
    t.decimal "round_wins"
    t.decimal "balance"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "room_users", "rooms"
  add_foreign_key "room_users", "users"
  add_foreign_key "round_users", "rounds"
  add_foreign_key "round_users", "users"
  add_foreign_key "rounds", "rooms"
end
