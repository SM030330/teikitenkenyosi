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

ActiveRecord::Schema.define(version: 2022_08_14_005205) do

  create_table "categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
  end

  create_table "items", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.date "do_day"
    t.date "notice_day"
    t.boolean "doing", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "inspection_id", null: false
    t.index ["inspection_id"], name: "index_items_on_inspection_id"
  end

  add_foreign_key "categories_to_inspections", "categories"
  add_foreign_key "categories_to_inspections", "inspections"
  add_foreign_key "items", "inspections"
end
