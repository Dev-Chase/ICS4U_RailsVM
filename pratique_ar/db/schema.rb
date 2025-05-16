# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_05_15_204616) do

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_name"
    t.string "contact_name"
    t.string "address"
    t.string "postal_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "country_id"
    t.integer "city_id"
    t.index ["city_id"], name: "index_customers_on_city_id"
    t.index ["country_id"], name: "index_customers_on_country_id"
  end

  create_table "employee_educations", force: :cascade do |t|
    t.string "institution"
    t.string "degree"
    t.date "date_obtained"
    t.boolean "completed"
    t.integer "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_educations_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.date "birth_date"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "employee_id"
    t.date "order_date"
    t.integer "shipper_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.integer "supplier_id"
    t.integer "category_id"
    t.string "unit"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shippers", force: :cascade do |t|
    t.string "shipper_name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "supplier_name"
    t.string "contact_name"
    t.string "address"
    t.string "postal_code"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "country_id"
    t.integer "city_id"
    t.index ["city_id"], name: "index_suppliers_on_city_id"
    t.index ["country_id"], name: "index_suppliers_on_country_id"
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "customers", "cities"
  add_foreign_key "customers", "countries"
  add_foreign_key "employee_educations", "employees"
  add_foreign_key "suppliers", "cities"
  add_foreign_key "suppliers", "countries"
end
