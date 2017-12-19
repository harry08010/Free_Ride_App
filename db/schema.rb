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

ActiveRecord::Schema.define(version: 20171130211408) do

  create_table "apply_relationships", force: :cascade do |t|
    t.integer "applier_id"
    t.integer "applied_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applied_id"], name: "index_apply_relationships_on_applied_id"
    t.index ["applier_id", "applied_id"], name: "index_apply_relationships_on_applier_id_and_applied_id", unique: true
    t.index ["applier_id"], name: "index_apply_relationships_on_applier_id"
  end

  create_table "approve_relationships", force: :cascade do |t|
    t.integer "approver_id"
    t.integer "approved_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approved_id"], name: "index_approve_relationships_on_approved_id"
    t.index ["approver_id", "approved_id"], name: "index_approve_relationships_on_approver_id_and_approved_id", unique: true
    t.index ["approver_id"], name: "index_approve_relationships_on_approver_id"
  end

  create_table "certificate_relationships", force: :cascade do |t|
    t.integer "cer_id"
    t.integer "ced_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ced_id"], name: "index_certificate_relationships_on_ced_id"
    t.index ["cer_id", "ced_id"], name: "index_certificate_relationships_on_cer_id_and_ced_id", unique: true
    t.index ["cer_id"], name: "index_certificate_relationships_on_cer_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.text "content"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "past_relationships", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "passenger_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id", "passenger_id"], name: "index_past_relationships_on_driver_id_and_passenger_id", unique: true
    t.index ["driver_id"], name: "index_past_relationships_on_driver_id"
    t.index ["passenger_id"], name: "index_past_relationships_on_passenger_id"
  end

  create_table "ride_posts", force: :cascade do |t|
    t.string "starting_point"
    t.string "destination"
    t.integer "available_seat_number"
    t.date "date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "time"
    t.text "note"
    t.boolean "locked"
    t.index ["user_id", "created_at"], name: "index_ride_posts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_ride_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "nickname"
    t.string "password_digest"
    t.string "email"
    t.integer "phone", limit: 8
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "gender"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
  end

end
