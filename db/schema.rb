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

ActiveRecord::Schema.define(version: 20140503122425) do

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "characters", force: true do |t|
    t.string   "name"
    t.text     "alias"
    t.text     "description"
    t.integer  "novel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "join_scene_characters", force: true do |t|
    t.integer "scene_id"
    t.integer "character_id"
  end

  create_table "join_scene_locations", force: true do |t|
    t.integer "scene_id"
    t.integer "location_id"
  end

  create_table "locations", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "novel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "novels", force: true do |t|
    t.string   "title"
    t.string   "genere"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "pending_invites", force: true do |t|
    t.integer  "user_id"
    t.integer  "user2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scenes", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "novel_id"
    t.text     "summary"
  end

  create_table "sharednovels", force: true do |t|
    t.integer  "user_id"
    t.integer  "novel_id"
    t.integer  "owner_id"
    t.boolean  "write"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
