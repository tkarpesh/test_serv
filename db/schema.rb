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

ActiveRecord::Schema.define(version: 20170618014521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_places", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "floor"
    t.integer "places_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_user_id"
    t.integer "enjoy_type"
    t.index ["floor"], name: "index_event_places_on_floor"
    t.index ["places_count"], name: "index_event_places_on_places_count"
    t.index ["title"], name: "index_event_places_on_title"
  end

  create_table "event_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_place_id"
    t.integer "count"
    t.datetime "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expiration"], name: "index_event_users_on_expiration"
    t.index ["user_id"], name: "index_event_users_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_type"
    t.integer "floor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "place_title"
    t.integer "persons_count"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.integer "telegram_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["telegram_id"], name: "index_users_on_telegram_id", unique: true
  end

end
