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

ActiveRecord::Schema.define(version: 20141102181647) do

  create_table "bookmarks", force: true do |t|
    t.integer  "count",          default: 0,     null: false
    t.boolean  "flag",           default: false, null: false
    t.integer  "user_id",                        null: false
    t.integer  "detail_file_id",                 null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "bookmarks", ["detail_file_id"], name: "index_bookmarks_on_detail_file_id"
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id"

  create_table "categories", force: true do |t|
    t.string  "name",      null: false
    t.integer "medium_id", null: false
  end

  add_index "categories", ["medium_id"], name: "index_categories_on_medium_id"
  add_index "categories", ["name"], name: "index_categories_on_name", unique: true

  create_table "detail_closures", force: true do |t|
    t.integer "depth",                null: false
    t.integer "ancestor_detail_id",   null: false
    t.integer "descendant_detail_id", null: false
  end

  add_index "detail_closures", ["ancestor_detail_id", "descendant_detail_id"], name: "index_closure_id", unique: true
  add_index "detail_closures", ["ancestor_detail_id"], name: "index_detail_closures_on_ancestor_detail_id"
  add_index "detail_closures", ["descendant_detail_id"], name: "index_detail_closures_on_descendant_detail_id"

  create_table "detail_files", force: true do |t|
    t.string   "name",             null: false
    t.datetime "file_modified_at", null: false
    t.integer  "mimetype_id"
    t.integer  "extension_id"
    t.integer  "detail_id",        null: false
  end

  add_index "detail_files", ["detail_id"], name: "index_detail_files_on_detail_id"
  add_index "detail_files", ["extension_id"], name: "index_detail_files_on_extension_id"
  add_index "detail_files", ["mimetype_id"], name: "index_detail_files_on_mimetype_id"

  create_table "detail_folders", force: true do |t|
    t.string  "name",        null: false
    t.string  "folder_hash", null: false
    t.integer "detail_id",   null: false
  end

  add_index "detail_folders", ["detail_id"], name: "index_detail_folders_on_detail_id"
  add_index "detail_folders", ["folder_hash"], name: "index_detail_folders_on_folder_hash", unique: true

  create_table "detail_tags", force: true do |t|
    t.integer  "detail_id",  null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "detail_tags", ["detail_id"], name: "index_detail_tags_on_detail_id"
  add_index "detail_tags", ["tag_id"], name: "index_detail_tags_on_tag_id"

  create_table "details", force: true do |t|
    t.string   "path",                                          null: false
    t.boolean  "is_dir",                                        null: false
    t.datetime "dropbox_modified_at",                           null: false
    t.integer  "size",                limit: 8, default: 0,     null: false
    t.boolean  "high_definition",               default: false, null: false
    t.boolean  "blu_ray",                       default: false, null: false
    t.boolean  "onair",                         default: false, null: false
    t.boolean  "movie",                         default: false, null: false
    t.boolean  "ova",                           default: false, null: false
    t.boolean  "complete",                      default: false, null: false
    t.integer  "year_id"
    t.integer  "season_id"
    t.integer  "category_id"
    t.integer  "medium_id"
    t.integer  "genre_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "is_root",                       default: false, null: false
    t.boolean  "have_child",                                    null: false
  end

  add_index "details", ["category_id"], name: "index_details_on_category_id"
  add_index "details", ["genre_id"], name: "index_details_on_genre_id"
  add_index "details", ["medium_id"], name: "index_details_on_medium_id"
  add_index "details", ["season_id"], name: "index_details_on_season_id"
  add_index "details", ["year_id"], name: "index_details_on_year_id"

  create_table "extensions", force: true do |t|
    t.string  "name",      limit: 10, null: false
    t.integer "medium_id",            null: false
  end

  add_index "extensions", ["medium_id"], name: "index_extensions_on_medium_id"
  add_index "extensions", ["name"], name: "index_extensions_on_name", unique: true

  create_table "genres", force: true do |t|
    t.string  "name",        null: false
    t.integer "category_id", null: false
  end

  add_index "genres", ["category_id"], name: "index_genres_on_category_id"
  add_index "genres", ["name"], name: "index_genres_on_name", unique: true

  create_table "media", force: true do |t|
    t.string "name", limit: 15, null: false
  end

  add_index "media", ["name"], name: "index_media_on_name", unique: true

  create_table "mimetypes", force: true do |t|
    t.string  "name",      null: false
    t.integer "medium_id", null: false
  end

  add_index "mimetypes", ["medium_id"], name: "index_mimetypes_on_medium_id"
  add_index "mimetypes", ["name"], name: "index_mimetypes_on_name", unique: true

  create_table "plays", force: true do |t|
    t.integer  "count",          default: 0, null: false
    t.datetime "played_at",                  null: false
    t.integer  "user_id",                    null: false
    t.integer  "detail_file_id",             null: false
  end

  add_index "plays", ["detail_file_id"], name: "index_plays_on_detail_file_id"
  add_index "plays", ["user_id"], name: "index_plays_on_user_id"

  create_table "seasons", force: true do |t|
    t.string "name", null: false
  end

  add_index "seasons", ["name"], name: "index_seasons_on_name", unique: true

  create_table "tags", force: true do |t|
    t.string "name", null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

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
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

  create_table "years", force: true do |t|
    t.integer "year", null: false
  end

  add_index "years", ["year"], name: "index_years_on_year", unique: true

end
