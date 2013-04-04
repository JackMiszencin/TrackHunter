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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130404231251) do

  create_table "current_songs", :force => true do |t|
    t.integer "song_id"
    t.integer "merchant_id"
  end

  add_index "current_songs", ["merchant_id"], :name => "index_current_songs_on_merchant_id"
  add_index "current_songs", ["song_id"], :name => "index_current_songs_on_song_id"

  create_table "merchants", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "current_song_id"
    t.integer  "previous_song_id"
  end

  add_index "merchants", ["current_song_id"], :name => "index_merchants_on_current_song_id"
  add_index "merchants", ["previous_song_id"], :name => "index_merchants_on_previous_song_id"

  create_table "pages", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "previous_songs", :force => true do |t|
    t.integer "song_id"
    t.integer "merchant_id"
  end

  add_index "previous_songs", ["merchant_id"], :name => "index_previous_songs_on_merchant_id"
  add_index "previous_songs", ["song_id"], :name => "index_previous_songs_on_song_id"

  create_table "ratings", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "like"
    t.integer  "user_id"
    t.integer  "song_id"
    t.integer  "merchant_id"
  end

  add_index "ratings", ["merchant_id"], :name => "index_ratings_on_merchant_id"
  add_index "ratings", ["song_id"], :name => "index_ratings_on_song_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "username"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "songs", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "artist"
    t.string   "title"
    t.string   "album"
    t.integer  "merchant_ids"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
