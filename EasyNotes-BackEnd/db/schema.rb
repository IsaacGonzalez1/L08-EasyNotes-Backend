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

ActiveRecord::Schema[7.0].define(version: 2023_04_25_184938) do
  create_table "collection_notes", id: false, force: :cascade do |t|
    t.integer "id_collection", null: false
    t.integer "id_note", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string "description"
    t.integer "id_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.string "name_user1"
    t.string "name_user2"
    t.integer "id_user1"
    t.integer "id_user2"
    t.integer "allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "user_id"
    t.integer "is_shared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.integer "admin"
    t.integer "is_enabled"
    t.string "hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
