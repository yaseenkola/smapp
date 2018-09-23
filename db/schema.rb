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

ActiveRecord::Schema.define(version: 2018_09_19_133200) do

  create_table "students", force: :cascade do |t|
    t.string "admission_no"
    t.date "admission_date"
    t.string "student_name"
    t.string "surname"
    t.string "class_applied"
    t.integer "age"
    t.date "dob"
    t.string "pob"
    t.string "card_no"
    t.string "gender"
    t.string "father_name"
    t.string "occupation"
    t.string "qualification"
    t.string "mob_no"
    t.string "email"
    t.string "address"
    t.string "mother_name"
    t.string "m_occupation"
    t.string "m_qualification"
    t.string "specialist"
    t.string "m_address"
    t.string "m_mob"
    t.string "m_email"
    t.string "whats_app"
    t.string "req_trans"
    t.string "trans_addr"
    t.string "remarks"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
