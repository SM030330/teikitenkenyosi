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

ActiveRecord::Schema.define(version: 2023_04_19_221952) do

  create_table "categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "categories_to_inspections", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.bigint "inspection_id", null: false
    t.index ["category_id"], name: "index_categories_to_inspections_on_category_id"
    t.index ["inspection_id"], name: "index_categories_to_inspections_on_inspection_id"
  end

  create_table "inspections", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.text "comment"
    t.boolean "doing", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.boolean "is_delete", default: false
    t.index ["user_id"], name: "index_inspections_on_user_id"
  end

  create_table "items", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.date "do_day", null: false
    t.date "notice_day", null: false
    t.boolean "doing", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "inspection_id", null: false
    t.bigint "user_id", null: false
    t.boolean "is_delete", default: false
    t.index ["inspection_id"], name: "index_items_on_inspection_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: "ゲストユーザー", null: false
    t.string "notice_email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "categories_to_inspections", "categories"
  add_foreign_key "categories_to_inspections", "inspections"
  add_foreign_key "inspections", "users"
  add_foreign_key "items", "inspections"
  add_foreign_key "items", "users"
end
