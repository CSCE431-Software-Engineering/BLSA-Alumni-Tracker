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

ActiveRecord::Schema[7.0].define(version: 2024_02_26_001643) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "area_joins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "practice_area_id"
    t.index ["practice_area_id"], name: "index_area_joins_on_practice_area_id"
    t.index ["user_id"], name: "index_area_joins_on_user_id"
  end

  create_table "education_infos", force: :cascade do |t|
    t.string "Semester"
    t.integer "Grad_Year"
    t.string "Degree_Type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "university_id"
    t.index ["university_id"], name: "index_education_infos_on_university_id"
    t.index ["user_id"], name: "index_education_infos_on_user_id"
  end

  create_table "firm_types", force: :cascade do |t|
    t.string "firm_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "practice_areas", force: :cascade do |t|
    t.string "practice_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "University", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["University"], name: "index_universities_on_University", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "First_Name"
    t.string "Last_Name"
    t.string "Middle_Name"
    t.string "Profile_Picture"
    t.string "Email"
    t.string "Phone_Number"
    t.string "Current_Job"
    t.string "Location"
    t.string "Linkedin_Profile"
    t.boolean "is_Admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "firm_type_id"
    t.index ["firm_type_id"], name: "index_users_on_firm_type_id"
  end

  add_foreign_key "area_joins", "practice_areas"
  add_foreign_key "area_joins", "users"
  add_foreign_key "education_infos", "universities"
  add_foreign_key "education_infos", "users"
  add_foreign_key "users", "firm_types"
end
