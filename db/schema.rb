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

ActiveRecord::Schema.define(version: 20150410002721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "email_id"
    t.integer  "user_id"
    t.integer  "score"
    t.text     "message"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "char_began_at"
    t.integer  "char_ended_at"
  end

  create_table "emails", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.text     "comment"
    t.integer  "referent_email_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "full_name"
    t.string   "email"
    t.integer  "karma",           default: 0
    t.boolean  "admin",           default: false
    t.string   "password_digest"
  end

end
