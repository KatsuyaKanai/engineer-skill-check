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

ActiveRecord::Schema.define(version: 2023_01_28_065721) do

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "office_id", null: false
    t.string "number", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "account", null: false
    t.string "password", null: false
    t.string "email", null: false
    t.date "date_of_joining", null: false
    t.boolean "employee_info_manage_auth", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "notification_posting_authority"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["email"], name: "index_employees_on_email"
    t.index ["number", "account"], name: "index_employees_on_number_and_account", unique: true
    t.index ["office_id"], name: "index_employees_on_office_id"
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "employee_id", null: false
    t.index ["employee_id"], name: "index_notifications_on_employee_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.text "profile", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_profiles_on_employee_id"
  end

  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "offices"
  add_foreign_key "notifications", "employees"
  add_foreign_key "profiles", "employees"
end
