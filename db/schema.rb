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

ActiveRecord::Schema[7.0].define(version: 2024_02_03_124318) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "diary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_bookmarks_on_diary_id"
    t.index ["user_id", "diary_id"], name: "index_bookmarks_on_user_id_and_diary_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "diary_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_comments_on_diary_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.string "title", null: false
    t.string "first_line", null: false
    t.string "second_line", null: false
    t.string "third_line", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "diary_image"
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookmarks", "diaries"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "diaries"
  add_foreign_key "comments", "users"
  add_foreign_key "diaries", "users"
end
