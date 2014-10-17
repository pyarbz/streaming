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

ActiveRecord::Schema.define(version: 20141017092333) do

  create_table "bitcasa_file_tags", force: true do |t|
    t.integer  "bitcasa_file_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bitcasa_file_tags", ["bitcasa_file_id"], name: "index_bitcasa_file_tags_on_bitcasa_file_id"
  add_index "bitcasa_file_tags", ["tag_id"], name: "index_bitcasa_file_tags_on_tag_id"

  create_table "bitcasa_files", force: true do |t|
    t.string   "name"
    t.string   "file_id"
    t.integer  "path_id"
    t.integer  "broadcast_id"
    t.integer  "size_id"
    t.integer  "extension_id"
    t.integer  "genre_id"
    t.integer  "bitcasa_time_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bitcasa_files", ["bitcasa_time_id"], name: "index_bitcasa_files_on_bitcasa_time_id"
  add_index "bitcasa_files", ["broadcast_id"], name: "index_bitcasa_files_on_broadcast_id"
  add_index "bitcasa_files", ["extension_id"], name: "index_bitcasa_files_on_extension_id"
  add_index "bitcasa_files", ["genre_id"], name: "index_bitcasa_files_on_genre_id"
  add_index "bitcasa_files", ["path_id"], name: "index_bitcasa_files_on_path_id"
  add_index "bitcasa_files", ["size_id"], name: "index_bitcasa_files_on_size_id"

  create_table "bitcasa_folder_tags", force: true do |t|
    t.integer  "bitcasa_folder_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bitcasa_folder_tags", ["bitcasa_folder_id"], name: "index_bitcasa_folder_tags_on_bitcasa_folder_id"
  add_index "bitcasa_folder_tags", ["tag_id"], name: "index_bitcasa_folder_tags_on_tag_id"

  create_table "bitcasa_folders", force: true do |t|
    t.string   "name"
    t.integer  "path_id"
    t.integer  "genre_id"
    t.integer  "bitcasa_time_id"
    t.integer  "size_id"
    t.integer  "broadcast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bitcasa_folders", ["bitcasa_time_id"], name: "index_bitcasa_folders_on_bitcasa_time_id"
  add_index "bitcasa_folders", ["broadcast_id"], name: "index_bitcasa_folders_on_broadcast_id"
  add_index "bitcasa_folders", ["genre_id"], name: "index_bitcasa_folders_on_genre_id"
  add_index "bitcasa_folders", ["path_id"], name: "index_bitcasa_folders_on_path_id"
  add_index "bitcasa_folders", ["size_id"], name: "index_bitcasa_folders_on_size_id"

  create_table "bitcasa_times", force: true do |t|
    t.datetime "created_at"
    t.datetime "modified_at"
    t.datetime "changed_at"
  end

  create_table "bookmarks", force: true do |t|
    t.integer  "count"
    t.boolean  "flag"
    t.integer  "user_id"
    t.integer  "bitcasa_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookmarks", ["bitcasa_file_id"], name: "index_bookmarks_on_bitcasa_file_id"
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id"

  create_table "broadcasts", force: true do |t|
    t.boolean "onair"
    t.boolean "movie"
    t.boolean "ova"
    t.boolean "complete"
    t.integer "year"
    t.integer "season_id"
  end

  add_index "broadcasts", ["season_id"], name: "index_broadcasts_on_season_id"

  create_table "categories", force: true do |t|
    t.string  "name"
    t.integer "media_id"
  end

  add_index "categories", ["media_id"], name: "index_categories_on_media_id"

  create_table "extensions", force: true do |t|
    t.string  "name"
    t.integer "media_id"
  end

  add_index "extensions", ["media_id"], name: "index_extensions_on_media_id"

  create_table "genres", force: true do |t|
    t.string  "name"
    t.integer "category_id"
  end

  add_index "genres", ["category_id"], name: "index_genres_on_category_id"

  create_table "media", force: true do |t|
    t.string "name"
  end

  create_table "paths", force: true do |t|
    t.string   "parent"
    t.string   "current"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plays", force: true do |t|
    t.integer  "count"
    t.datetime "played_at"
    t.integer  "user_id"
    t.integer  "bitcasa_file_id"
  end

  add_index "plays", ["bitcasa_file_id"], name: "index_plays_on_bitcasa_file_id"
  add_index "plays", ["user_id"], name: "index_plays_on_user_id"

  create_table "seasons", force: true do |t|
    t.string "name"
  end

  create_table "sizes", force: true do |t|
    t.integer "size"
    t.boolean "high"
    t.boolean "blu_ray"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
