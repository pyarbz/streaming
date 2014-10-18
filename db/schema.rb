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

ActiveRecord::Schema.define(version: 20141018164229) do

  create_table "bitcasa_file_tags", force: true do |t|
    t.integer  "bitcasa_file_id", null: false
    t.integer  "tag_id",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "bitcasa_file_tags", ["bitcasa_file_id"], name: "index_bitcasa_file_tags_on_bitcasa_file_id"
  add_index "bitcasa_file_tags", ["tag_id"], name: "index_bitcasa_file_tags_on_tag_id"

  create_table "bitcasa_files", force: true do |t|
    t.string   "name",         null: false
    t.string   "file_id",      null: false
    t.integer  "mimetype_id",  null: false
    t.integer  "extension_id", null: false
    t.integer  "category_id"
    t.integer  "media_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bitcasa_files", ["category_id"], name: "index_bitcasa_files_on_category_id"
  add_index "bitcasa_files", ["extension_id"], name: "index_bitcasa_files_on_extension_id"
  add_index "bitcasa_files", ["genre_id"], name: "index_bitcasa_files_on_genre_id"
  add_index "bitcasa_files", ["media_id"], name: "index_bitcasa_files_on_media_id"
  add_index "bitcasa_files", ["mimetype_id"], name: "index_bitcasa_files_on_mimetype_id"

  create_table "bitcasa_folder_tags", force: true do |t|
    t.integer  "bitcasa_folder_id", null: false
    t.integer  "tag_id",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "bitcasa_folder_tags", ["bitcasa_folder_id"], name: "index_bitcasa_folder_tags_on_bitcasa_folder_id"
  add_index "bitcasa_folder_tags", ["tag_id"], name: "index_bitcasa_folder_tags_on_tag_id"

  create_table "bitcasa_folders", force: true do |t|
    t.string   "name",        null: false
    t.integer  "category_id"
    t.integer  "media_id"
    t.integer  "genre_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bitcasa_folders", ["category_id"], name: "index_bitcasa_folders_on_category_id"
  add_index "bitcasa_folders", ["genre_id"], name: "index_bitcasa_folders_on_genre_id"
  add_index "bitcasa_folders", ["media_id"], name: "index_bitcasa_folders_on_media_id"

  create_table "bookmarks", force: true do |t|
    t.integer  "count",           default: 0,     null: false
    t.boolean  "flag",            default: false, null: false
    t.integer  "user_id",                         null: false
    t.integer  "bitcasa_file_id",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "bookmarks", ["bitcasa_file_id"], name: "index_bookmarks_on_bitcasa_file_id"
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id"

  create_table "categories", force: true do |t|
    t.string "name", null: false
  end

  create_table "category_genres", force: true do |t|
    t.integer "category_id", null: false
    t.integer "genre_id",    null: false
  end

  add_index "category_genres", ["category_id"], name: "index_category_genres_on_category_id"
  add_index "category_genres", ["genre_id"], name: "index_category_genres_on_genre_id"

  create_table "category_media", force: true do |t|
    t.integer "category_id", null: false
    t.integer "media_id",    null: false
  end

  add_index "category_media", ["category_id"], name: "index_category_media_on_category_id"
  add_index "category_media", ["media_id"], name: "index_category_media_on_media_id"

  create_table "details", force: true do |t|
    t.string   "parent_path",                                   null: false
    t.string   "current_path",                                  null: false
    t.integer  "depth",                                         null: false
    t.datetime "bitcasa_created_at",                            null: false
    t.datetime "bitcasa_modified_at",                           null: false
    t.datetime "bitcasa_changed_at",                            null: false
    t.integer  "size",                limit: 8, default: 0,     null: false
    t.boolean  "high_definition",               default: false, null: false
    t.boolean  "blu_ray",                       default: false, null: false
    t.boolean  "onair",                         default: false, null: false
    t.boolean  "movie",                         default: false, null: false
    t.boolean  "ova",                           default: false, null: false
    t.boolean  "complete",                      default: false, null: false
    t.integer  "year_id"
    t.integer  "season_id"
    t.integer  "bitcasa_file_id"
    t.integer  "bitcasa_folder_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "details", ["bitcasa_file_id"], name: "index_details_on_bitcasa_file_id"
  add_index "details", ["bitcasa_folder_id"], name: "index_details_on_bitcasa_folder_id"
  add_index "details", ["season_id"], name: "index_details_on_season_id"
  add_index "details", ["year_id"], name: "index_details_on_year_id"

  create_table "extension_media", force: true do |t|
    t.integer "mimetype_id"
    t.integer "extension_id", null: false
    t.integer "media_id",     null: false
  end

  add_index "extension_media", ["extension_id"], name: "index_extension_media_on_extension_id"
  add_index "extension_media", ["media_id"], name: "index_extension_media_on_media_id"
  add_index "extension_media", ["mimetype_id"], name: "index_extension_media_on_mimetype_id"

  create_table "extensions", force: true do |t|
    t.string "name", null: false
  end

  create_table "genres", force: true do |t|
    t.string "name", null: false
  end

  create_table "media", force: true do |t|
    t.string "name", null: false
  end

  create_table "mimetypes", force: true do |t|
    t.string "name"
  end

  create_table "plays", force: true do |t|
    t.integer  "count",           default: 0, null: false
    t.datetime "played_at",                   null: false
    t.integer  "user_id",                     null: false
    t.integer  "bitcasa_file_id",             null: false
  end

  add_index "plays", ["bitcasa_file_id"], name: "index_plays_on_bitcasa_file_id"
  add_index "plays", ["user_id"], name: "index_plays_on_user_id"

  create_table "seasons", force: true do |t|
    t.string "name", null: false
  end

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
    t.string   "provider",                            null: false
    t.string   "uid",                                 null: false
    t.string   "name",                                null: false
    t.string   "token",                               null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "years", force: true do |t|
    t.integer "year", null: false
  end

end
