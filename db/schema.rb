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

ActiveRecord::Schema.define(version: 20150723190620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "artist_trackings", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "artist_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name",            null: false
    t.string "image_url"
    t.text   "description"
    t.string "small_image_url"
  end

  add_index "artists", ["name"], name: "index_artists_on_name", unique: true, using: :btree

  create_table "concert_photos", force: :cascade do |t|
    t.integer  "concert_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "concert_trackings", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "concert_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "attending",  default: false
  end

  create_table "concerts", force: :cascade do |t|
    t.integer  "artist_id",       null: false
    t.integer  "locale_id",       null: false
    t.date     "date",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "small_image_url"
  end

  create_table "locales", force: :cascade do |t|
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locales", ["city"], name: "index_locales_on_city", unique: true, using: :btree
  add_index "locales", ["state"], name: "index_locales_on_state", using: :btree

  create_table "states", force: :cascade do |t|
    t.string "abbrev", null: false
  end

  add_index "states", ["abbrev"], name: "index_states_on_abbrev", unique: true, using: :btree

  create_table "user_locales", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "locale_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
