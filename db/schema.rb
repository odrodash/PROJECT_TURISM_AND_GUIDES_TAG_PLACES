# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_17_014421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.bigint "place_id", null: false
    t.bigint "guide_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guide_id"], name: "index_bookings_on_guide_id"
    t.index ["place_id"], name: "index_bookings_on_place_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "guides", force: :cascade do |t|
    t.string "guide_name"
    t.string "dni"
    t.string "email"
    t.string "phone_number"
    t.date "date_of_birth"
    t.string "country"
    t.string "city"
    t.integer "age"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "place_id"
    t.bigint "user_id"
    t.index ["place_id"], name: "index_guides_on_place_id"
    t.index ["user_id"], name: "index_guides_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "country"
    t.text "description"
    t.integer "rating"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "review_guides", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.bigint "guide_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["guide_id"], name: "index_review_guides_on_guide_id"
    t.index ["user_id"], name: "index_review_guides_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "guide_id"
    t.bigint "place_id"
    t.bigint "user_id"
    t.index ["guide_id"], name: "index_reviews_on_guide_id"
    t.index ["place_id"], name: "index_reviews_on_place_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "guides"
  add_foreign_key "bookings", "places"
  add_foreign_key "bookings", "users"
  add_foreign_key "guides", "users"
  add_foreign_key "places", "users"
  add_foreign_key "review_guides", "guides"
  add_foreign_key "review_guides", "users"
  add_foreign_key "reviews", "users"
end
