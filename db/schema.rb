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

ActiveRecord::Schema.define(version: 20170308182435) do

  create_table "definition_groups", force: :cascade do |t|
    t.integer  "definition_id"
    t.integer  "group_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "definition_themes", force: :cascade do |t|
    t.integer  "definition_id"
    t.integer  "theme_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "definition_translations", force: :cascade do |t|
    t.integer  "definition_id"
    t.integer  "word_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "definitions", force: :cascade do |t|
    t.text     "content"
    t.boolean  "is_fr"
    t.boolean  "is_li"
    t.integer  "word_id"
    t.integer  "contributor_id"
    t.string   "source"
    t.boolean  "is_validated"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "exemples", force: :cascade do |t|
    t.text     "content"
    t.boolean  "is_fr"
    t.boolean  "is_li"
    t.integer  "definition_id"
    t.integer  "contributor_id"
    t.string   "source"
    t.boolean  "is_validated"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name_li"
    t.string   "name_fr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "illustrations", force: :cascade do |t|
    t.string   "description"
    t.boolean  "is_fr"
    t.boolean  "is_li"
    t.string   "video"
    t.integer  "contributor_id"
    t.string   "source"
    t.boolean  "is_validated"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "home"
    t.string   "about"
    t.string   "terms"
    t.string   "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "theme_id"
    t.boolean  "certified"
    t.boolean  "practiced"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "last_diploma"
    t.text     "last_project"
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_fr"
    t.boolean  "is_li"
    t.integer  "contributor_id"
    t.string   "source"
    t.boolean  "is_validated"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_contributor"
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "words", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_fr"
    t.boolean  "is_li"
    t.string   "prononciation"
    t.integer  "contributor_id"
    t.string   "source"
    t.boolean  "is_validated"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "root"
    t.string   "structure"
    t.string   "role"
  end

end
