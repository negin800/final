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

ActiveRecord::Schema.define(version: 0) do

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "user_id"
    t.integer "host_id"
    t.integer "posting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["host_id"], name: "index_bookings_on_host_id"
    t.index ["posting_id"], name: "index_bookings_on_posting_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "postings", force: :cascade do |t|
    t.text "title"
    t.text "summary"
    t.text "location"
    t.integer "price"
    t.text "photo_url"
    t.integer "host_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["host_id"], name: "index_postings_on_host_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password_digest"
    t.text "pets"
    t.boolean "is_host", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
