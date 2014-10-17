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

ActiveRecord::Schema.define(version: 20141017154812) do

  create_table "bitcasa_file_tags", force: true do |t|
    t.integer  "bitcasa_file_id", null: false
    t.integer  "tag_id",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "bitcasa_file_tags", ["bitcasa_file_id"], name: "index_bitcasa_file_tags_on_bitcasa_file_id"
  add_index "bitcasa_file_tags", ["tag_id"], name: "index_bitcasa_file_tags_on_tag_id"

  create_table "bitcasa_files", force: true do |t|
    t.string   "name",        null: false
    t.string   "file_id",     null: false
    t.integer  "play_id",     null: false
    t.integer  "bookmark_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bitcasa_files", ["bookmark_id"], name: "index_bitcasa_files_on_bookmark_id"
  add_index "bitcasa_files", ["play_id"], name: "index_bitcasa_files_on_play_id"

  create_table "bitcasa_folder_tags", force: true do |t|
    t.integer  "bitcasa_folder_id", null: false
    t.integer  "tag_id",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "bitcasa_folder_tags", ["bitcasa_folder_id"], name: "index_bitcasa_folder_tags_on_bitcasa_folder_id"
  add_index "bitcasa_folder_tags", ["tag_id"], name: "index_bitcasa_folder_tags_on_tag_id"

  create_table "bitcasa_folders", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bitcasa_times", force: true do |t|
    t.datetime "created_at",        null: false
    t.datetime "modified_at",       null: false
    t.datetime "changed_at",        null: false
    t.integer  "bitcasa_file_id",   null: false
    t.integer  "bitcasa_folder_id", null: false
  end

  add_index "bitcasa_times", ["bitcasa_file_id"], name: "index_bitcasa_times_on_bitcasa_file_id"
  add_index "bitcasa_times", ["bitcasa_folder_id"], name: "index_bitcasa_times_on_bitcasa_folder_id"

  create_table "bookmarks", force: true do |t|
    t.integer  "count",      default: 0,     null: false
    t.boolean  "flag",       default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "broadcasts", force: true do |t|
    t.boolean "onair",             default: false, null: false
    t.boolean "movie",             default: false, null: false
    t.boolean "ova",               default: false, null: false
    t.boolean "complete",          default: false, null: false
    t.integer "year"
    t.integer "bitcasa_file_id",                   null: false
    t.integer "bitcasa_folder_id",                 null: false
  end

  add_index "broadcasts", ["bitcasa_file_id"], name: "index_broadcasts_on_bitcasa_file_id"
  add_index "broadcasts", ["bitcasa_folder_id"], name: "index_broadcasts_on_bitcasa_folder_id"

  create_table "categories", force: true do |t|
    t.string  "name"
    t.integer "genre_id", null: false
  end

  add_index "categories", ["genre_id"], name: "index_categories_on_genre_id"

  create_table "extensions", force: true do |t|
    t.string  "name",            null: false
    t.integer "bitcasa_file_id", null: false
  end

  add_index "extensions", ["bitcasa_file_id"], name: "index_extensions_on_bitcasa_file_id"

  create_table "genres", force: true do |t|
    t.string  "name"
    t.integer "bitcasa_file_id",   null: false
    t.integer "bitcasa_folder_id", null: false
  end

  add_index "genres", ["bitcasa_file_id"], name: "index_genres_on_bitcasa_file_id"
  add_index "genres", ["bitcasa_folder_id"], name: "index_genres_on_bitcasa_folder_id"

  create_table "media", force: true do |t|
    t.string  "name"
    t.integer "category_id",  null: false
    t.integer "extension_id", null: false
  end

  add_index "media", ["category_id"], name: "index_media_on_category_id"
  add_index "media", ["extension_id"], name: "index_media_on_extension_id"

  create_table "paths", force: true do |t|
    t.string   "parent",            null: false
    t.string   "current",           null: false
    t.integer  "depth",             null: false
    t.integer  "bitcasa_file_id",   null: false
    t.integer  "bitcasa_folder_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paths", ["bitcasa_file_id"], name: "index_paths_on_bitcasa_file_id"
  add_index "paths", ["bitcasa_folder_id"], name: "index_paths_on_bitcasa_folder_id"

  create_table "plays", force: true do |t|
    t.integer  "count",     default: 0, null: false
    t.datetime "played_at",             null: false
  end

  create_table "seasons", force: true do |t|
    t.string  "name"
    t.integer "broadcast_id", null: false
  end

  add_index "seasons", ["broadcast_id"], name: "index_seasons_on_broadcast_id"

  create_table "sizes", force: true do |t|
    t.integer "size",              limit: 8, default: 0,     null: false
    t.boolean "high",                        default: false, null: false
    t.boolean "blu_ray",                     default: false, null: false
    t.integer "bitcasa_file_id",                             null: false
    t.integer "bitcasa_folder_id",                           null: false
  end

  add_index "sizes", ["bitcasa_file_id"], name: "index_sizes_on_bitcasa_file_id"
  add_index "sizes", ["bitcasa_folder_id"], name: "index_sizes_on_bitcasa_folder_id"

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
