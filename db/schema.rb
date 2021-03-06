# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_14_054445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claps", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_claps_on_post_id"
  end

  create_table "points", force: :cascade do |t|
    t.integer "amount", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "introduced_user_id", null: false
    t.index ["introduced_user_id"], name: "index_posts_on_introduced_user_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "received_points", force: :cascade do |t|
    t.integer "amount", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_received_points_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "google_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "claps", "posts"
  add_foreign_key "points", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "posts", "users", column: "introduced_user_id"
  add_foreign_key "received_points", "users"
end
