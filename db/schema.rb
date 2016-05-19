# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 20160519084030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "game_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "game_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "playstore_url_id"
  end

  create_table "leaderboards", force: :cascade do |t|
    t.string   "leaderboard_name"
    t.string   "icon"
    t.text     "desc"
    t.integer  "list_order"
    t.boolean  "limit"
    t.string   "score_formatting"
    t.string   "type"
    t.string   "time_frame"
    t.string   "ordering"
    t.integer  "game_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "multiplayer_scores", force: :cascade do |t|
    t.integer  "stat_id"
    t.string   "user1_score"
    t.string   "user2_score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "multiplayer_stats", force: :cascade do |t|
    t.string   "user1_id"
    t.string   "user2_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playstore_urls", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.integer  "age"
    t.string   "access_token"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "game_categories", "categories"
  add_foreign_key "game_categories", "games"
  add_foreign_key "games", "playstore_urls"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

end
