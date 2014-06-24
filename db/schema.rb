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

ActiveRecord::Schema.define(version: 20140624005321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "distance_samples", force: true do |t|
    t.integer  "router_id"
    t.string   "router_mac"
    t.float    "distance"
    t.float    "power"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "set_id"
  end

  create_table "messages", force: true do |t|
    t.string   "title"
    t.string   "icon"
    t.string   "body"
    t.time     "msg_time"
    t.integer  "navpoint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "navpoints", force: true do |t|
    t.float    "x"
    t.float    "y"
    t.float    "z"
    t.float    "range"
    t.string   "title"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routers", force: true do |t|
    t.integer  "site_id"
    t.decimal  "x"
    t.decimal  "y"
    t.decimal  "z"
    t.string   "ssid"
    t.string   "uid"
    t.decimal  "power"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "frequency"
  end

  create_table "sites", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", force: true do |t|
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.float    "x"
    t.float    "y"
    t.float    "z"
    t.float    "x_conf"
    t.float    "y_conf"
    t.float    "z_conf"
    t.datetime "local_timestamp"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "roles_mask"
    t.integer  "site_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
