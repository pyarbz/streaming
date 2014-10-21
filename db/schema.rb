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

ActiveRecord::Schema.define(version: 20141021201205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bitcasa_files", force: true do |t|
    t.string  "name",         null: false
    t.string  "file_id",      null: false
    t.integer "mimetype_id",  null: false
    t.integer "extension_id", null: false
    t.integer "detail_id",    null: false
  end

  add_index "bitcasa_files", ["detail_id"], name: "index_bitcasa_files_on_detail_id", using: :btree
  add_index "bitcasa_files", ["extension_id"], name: "index_bitcasa_files_on_extension_id", using: :btree
  add_index "bitcasa_files", ["file_id"], name: "index_bitcasa_files_on_file_id", unique: true, using: :btree
  add_index "bitcasa_files", ["mimetype_id"], name: "index_bitcasa_files_on_mimetype_id", using: :btree

  create_table "bitcasa_folders", force: true do |t|
    t.string  "name",      null: false
    t.integer "detail_id", null: false
  end

  add_index "bitcasa_folders", ["detail_id"], name: "index_bitcasa_folders_on_detail_id", using: :btree

  create_table "bookmarks", force: true do |t|
    t.integer  "count",           default: 0,     null: false
    t.boolean  "flag",            default: false, null: false
    t.integer  "user_id",                         null: false
    t.integer  "bitcasa_file_id",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "bookmarks", ["bitcasa_file_id"], name: "index_bookmarks_on_bitcasa_file_id", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string  "name",      null: false
    t.integer "medium_id", null: false
  end

  add_index "categories", ["medium_id"], name: "index_categories_on_medium_id", using: :btree
  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "detail_closures", force: true do |t|
    t.integer "depth",                null: false
    t.integer "ancestor_detail_id",   null: false
    t.integer "descendant_detail_id", null: false
  end

  create_table "detail_tags", force: true do |t|
    t.integer  "detail_id",  null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "detail_tags", ["detail_id"], name: "index_detail_tags_on_detail_id", using: :btree
  add_index "detail_tags", ["tag_id"], name: "index_detail_tags_on_tag_id", using: :btree

  create_table "details", force: true do |t|
    t.string   "path",                                          null: false
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
    t.integer  "category_id"
    t.integer  "medium_id"
    t.integer  "genre_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "details", ["category_id"], name: "index_details_on_category_id", using: :btree
  add_index "details", ["genre_id"], name: "index_details_on_genre_id", using: :btree
  add_index "details", ["medium_id"], name: "index_details_on_medium_id", using: :btree
  add_index "details", ["season_id"], name: "index_details_on_season_id", using: :btree
  add_index "details", ["year_id"], name: "index_details_on_year_id", using: :btree

  create_table "extensions", force: true do |t|
    t.string  "name",      null: false
    t.integer "medium_id", null: false
  end

  add_index "extensions", ["medium_id"], name: "index_extensions_on_medium_id", using: :btree
  add_index "extensions", ["name"], name: "index_extensions_on_name", unique: true, using: :btree

  create_table "genres", force: true do |t|
    t.string  "name",        null: false
    t.integer "category_id", null: false
  end

  add_index "genres", ["category_id"], name: "index_genres_on_category_id", using: :btree
  add_index "genres", ["name"], name: "index_genres_on_name", unique: true, using: :btree

  create_table "media", force: true do |t|
    t.string "name", null: false
  end

  add_index "media", ["name"], name: "index_media_on_name", unique: true, using: :btree

  create_table "mimetypes", force: true do |t|
    t.string  "name",      null: false
    t.integer "medium_id", null: false
  end

  add_index "mimetypes", ["medium_id"], name: "index_mimetypes_on_medium_id", using: :btree
  add_index "mimetypes", ["name"], name: "index_mimetypes_on_name", unique: true, using: :btree

  create_table "plays", force: true do |t|
    t.integer  "count",           default: 0, null: false
    t.datetime "played_at",                   null: false
    t.integer  "user_id",                     null: false
    t.integer  "bitcasa_file_id",             null: false
  end

  add_index "plays", ["bitcasa_file_id"], name: "index_plays_on_bitcasa_file_id", using: :btree
  add_index "plays", ["user_id"], name: "index_plays_on_user_id", using: :btree

  create_table "seasons", force: true do |t|
    t.string "name", null: false
  end

  add_index "seasons", ["name"], name: "index_seasons_on_name", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name", null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

  create_table "years", force: true do |t|
    t.integer "year", null: false
  end

  add_index "years", ["year"], name: "index_years_on_year", unique: true, using: :btree

  add_foreign_key "bitcasa_files", "details", name: "bitcasa_files_detail_id_fk"
  add_foreign_key "bitcasa_files", "extensions", name: "bitcasa_files_extension_id_fk"
  add_foreign_key "bitcasa_files", "mimetypes", name: "bitcasa_files_mimetype_id_fk"

  add_foreign_key "bitcasa_folders", "details", name: "bitcasa_folders_detail_id_fk"

  add_foreign_key "bookmarks", "bitcasa_files", name: "bookmarks_bitcasa_file_id_fk"
  add_foreign_key "bookmarks", "users", name: "bookmarks_user_id_fk"

  add_foreign_key "categories", "media", name: "categories_medium_id_fk"

  add_foreign_key "detail_closures", "details", name: "detail_closures_ancestor_detail_id_fk", column: "ancestor_detail_id"
  add_foreign_key "detail_closures", "details", name: "detail_closures_descendant_detail_id_fk", column: "descendant_detail_id"

  add_foreign_key "detail_tags", "details", name: "detail_tags_detail_id_fk"
  add_foreign_key "detail_tags", "tags", name: "detail_tags_tag_id_fk"

  add_foreign_key "details", "categories", name: "details_category_id_fk"
  add_foreign_key "details", "genres", name: "details_genre_id_fk"
  add_foreign_key "details", "media", name: "details_medium_id_fk"
  add_foreign_key "details", "seasons", name: "details_season_id_fk"
  add_foreign_key "details", "years", name: "details_year_id_fk"

  add_foreign_key "extensions", "media", name: "extensions_medium_id_fk"

  add_foreign_key "genres", "categories", name: "genres_category_id_fk"

  add_foreign_key "mimetypes", "media", name: "mimetypes_medium_id_fk"

  add_foreign_key "plays", "bitcasa_files", name: "plays_bitcasa_file_id_fk"
  add_foreign_key "plays", "users", name: "plays_user_id_fk"

end
