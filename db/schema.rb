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

ActiveRecord::Schema.define(version: 20150917010648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leaders", force: :cascade do |t|
    t.integer "user_id"
    t.string  "description"
  end

  add_index "leaders", ["user_id"], name: "index_leaders_on_user_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokens", ["text"], name: "index_tokens_on_text", using: :btree

  create_table "trips", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "cost"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "leader_id"
  end

  create_table "trips_users", id: false, force: :cascade do |t|
    t.integer "trip_id"
    t.integer "user_id"
  end

  add_index "trips_users", ["trip_id"], name: "index_trips_users_on_trip_id", using: :btree
  add_index "trips_users", ["user_id"], name: "index_trips_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role"
    t.string   "affiliation"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
