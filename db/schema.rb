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

ActiveRecord::Schema[7.0].define(version: 2023_06_27_134104) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.string "title"
    t.string "type"
    t.bigint "user_id", null: false
    t.bigint "practician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["practician_id"], name: "index_appointments_on_practician_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "follow_ups", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "posology"
    t.integer "hourly_frequency"
    t.integer "day_frequency"
    t.bigint "prescription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prescription_id"], name: "index_follow_ups_on_prescription_id"
  end

  create_table "measures", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "valeur"
    t.string "unit"
    t.date "start_date"
    t.date "end_date"
    t.integer "day_frequency"
    t.integer "hourly_frequency"
    t.bigint "prescription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prescription_id"], name: "index_measures_on_prescription_id"
  end

  create_table "patho_prescriptions", force: :cascade do |t|
    t.bigint "prescription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pathologie_id"
    t.index ["pathologie_id"], name: "index_patho_prescriptions_on_pathologie_id"
    t.index ["prescription_id"], name: "index_patho_prescriptions_on_prescription_id"
  end

  create_table "pathologies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pathologies_on_user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "practician"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "patient", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "users"
  add_foreign_key "appointments", "users", column: "practician_id"
  add_foreign_key "follow_ups", "prescriptions"
  add_foreign_key "measures", "prescriptions"
  add_foreign_key "patho_prescriptions", "pathologies", column: "pathologie_id"
  add_foreign_key "patho_prescriptions", "prescriptions"
  add_foreign_key "pathologies", "users"
  add_foreign_key "prescriptions", "users"
end
