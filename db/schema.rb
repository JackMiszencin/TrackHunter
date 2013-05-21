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

ActiveRecord::Schema.define(:version => 20130521025812) do

  create_table "listeners", :force => true do |t|
    t.integer  "user_id"
    t.integer  "merchant_id"
    t.float    "lat",         :default => 0.0, :null => false
    t.float    "lng",         :default => 0.0, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "merchant_ratings", :force => true do |t|
    t.integer "merchant_id"
    t.integer "rating_id"
  end

  add_index "merchant_ratings", ["merchant_id"], :name => "index_merchant_ratings_on_merchant_id"
  add_index "merchant_ratings", ["rating_id"], :name => "index_merchant_ratings_on_rating_id"

  create_table "merchants", :force => true do |t|
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "current_song_id"
    t.integer  "previous_song_id"
    t.float    "lat"
    t.float    "lng"
    t.integer  "owner_id",         :default => 1, :null => false
    t.string   "zip"
  end

  add_index "merchants", ["current_song_id"], :name => "index_merchants_on_current_song_id"
  add_index "merchants", ["previous_song_id"], :name => "index_merchants_on_previous_song_id"

  create_table "ratings", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "like"
    t.integer  "song_id"
    t.integer  "merchant_id"
    t.integer  "owner_id"
    t.integer  "listener_id"
  end

  add_index "ratings", ["merchant_id"], :name => "index_ratings_on_merchant_id"
  add_index "ratings", ["owner_id"], :name => "index_ratings_on_owner_id"
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
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "first_name",                                :null => false
    t.string   "last_name",                                 :null => false
    t.boolean  "is_merchant",            :default => false, :null => false
    t.boolean  "is_admin",               :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
