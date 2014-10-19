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

ActiveRecord::Schema.define(version: 20141019165902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "remote_uid"
    t.string   "email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "webinars", force: true do |t|
    t.string   "title"
    t.string   "youtube_url"
    t.string   "blogpost_url"
    t.string   "doc_url"
    t.string   "code_url"
    t.string   "language"
    t.boolean  "translation_available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "description"
  end

  add_index "webinars", ["user_id"], name: "index_webinars_on_user_id", using: :btree

end
