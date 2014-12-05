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

ActiveRecord::Schema.define(version: 20141205162836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "stars", force: true do |t|
    t.integer "webinar_id"
    t.integer "user_id"
  end

  add_index "stars", ["user_id"], name: "index_stars_on_user_id", using: :btree
  add_index "stars", ["webinar_id"], name: "index_stars_on_webinar_id", using: :btree

  create_table "suggestion_votes", force: true do |t|
    t.integer "suggestion_id"
    t.integer "user_id"
  end

  add_index "suggestion_votes", ["suggestion_id"], name: "index_suggestion_votes_on_suggestion_id", using: :btree
  add_index "suggestion_votes", ["user_id"], name: "index_suggestion_votes_on_user_id", using: :btree

  create_table "suggestions", force: true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "suggestion_votes_count", default: 0, null: false
  end

  add_index "suggestions", ["user_id"], name: "index_suggestions_on_user_id", using: :btree

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

  create_table "votes", force: true do |t|
    t.integer "webinar_id"
    t.integer "user_id"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["webinar_id"], name: "index_votes_on_webinar_id", using: :btree

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
    t.boolean  "upcoming",              default: false
    t.datetime "planned_date"
    t.boolean  "reminded",              default: false
    t.integer  "stars_count",           default: 0,     null: false
    t.integer  "votes_count",           default: 0,     null: false
  end

  add_index "webinars", ["user_id"], name: "index_webinars_on_user_id", using: :btree

end
