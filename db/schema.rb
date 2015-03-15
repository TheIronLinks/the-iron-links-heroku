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

ActiveRecord::Schema.define(version: 20150315160659) do

  create_table "educations", force: :cascade do |t|
    t.string   "school_name"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "concentration"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "graduate_id"
  end

  create_table "employers", force: :cascade do |t|
    t.string   "name"
    t.string   "industry"
    t.string   "founded"
    t.integer  "size"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "company"
    t.string   "position"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "graduate_id"
  end

  create_table "graduates", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "grad_city"
    t.string   "grad_state"
    t.string   "grad_zip"
    t.date     "grad_date"
    t.string   "grad_focus"
    t.string   "current_zip"
    t.string   "workflow_state"
    t.text     "additional_info"
    t.text     "image_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "current_location"
    t.string   "email"
  end

  create_table "job_listings", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.string   "description"
    t.string   "post_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "location_id"
  end

  create_table "links", force: :cascade do |t|
    t.text     "url"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "graduate_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "employer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "skill_graduates", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "graduate_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "userable_type"
    t.integer  "userable_id"
    t.string   "account_type",           default: "student"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
