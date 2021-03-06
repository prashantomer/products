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

ActiveRecord::Schema.define(version: 20160521111642) do

  create_table "albums", force: :cascade do |t|
    t.string   "user_id",    limit: 255
    t.string   "picture",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "solution_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "options", force: :cascade do |t|
    t.string   "option",      limit: 255, null: false
    t.integer  "question_id", limit: 4,   null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question",     limit: 255,             null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "right_option", limit: 100
    t.integer  "position",     limit: 4,   default: 0
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.text     "solution",    limit: 65535, null: false
    t.integer  "solution_id", limit: 4
    t.integer  "user_id",     limit: 4,     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "question_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "prof_pic",               limit: 255
    t.string   "address",                limit: 255
    t.integer  "contact",                limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_answers", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "question_id", limit: 4
    t.string   "answer",      limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "status",                  default: false
  end

  create_table "users_roles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4, default: 2
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "users_roles", ["role_id"], name: "index_users_roles_on_role_id", using: :btree
  add_index "users_roles", ["user_id"], name: "index_users_roles_on_user_id", using: :btree

end
