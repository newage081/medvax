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

ActiveRecord::Schema[7.0].define(version: 2024_07_06_005921) do
  create_table "personals", force: :cascade do |t|
    t.string "fio"
    t.string "date_of_birthday"
    t.string "gender"
    t.string "email"
    t.string "phone_number"
    t.string "departament"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "doctor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vaccination_schedules", force: :cascade do |t|
    t.integer "personal_id", null: false
    t.integer "vaccine_id", null: false
    t.integer "room_id", null: false
    t.date "vaccination_date"
    t.time "vaccination_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_id"], name: "index_vaccination_schedules_on_personal_id"
    t.index ["room_id"], name: "index_vaccination_schedules_on_room_id"
    t.index ["vaccine_id"], name: "index_vaccination_schedules_on_vaccine_id"
  end

  create_table "vaccinations", force: :cascade do |t|
    t.integer "personal_id", null: false
    t.integer "vaccine_id", null: false
    t.date "vaccination_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_id"], name: "index_vaccinations_on_personal_id"
    t.index ["vaccine_id"], name: "index_vaccinations_on_vaccine_id"
  end

  create_table "vaccines", force: :cascade do |t|
    t.string "name"
    t.string "manufacturer"
    t.text "storage_conditions"
    t.text "description"
    t.integer "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "mandatory"
    t.string "vaccine_type"
  end

  add_foreign_key "vaccination_schedules", "personals"
  add_foreign_key "vaccination_schedules", "rooms"
  add_foreign_key "vaccination_schedules", "vaccines"
  add_foreign_key "vaccinations", "personals"
  add_foreign_key "vaccinations", "vaccines"
end
