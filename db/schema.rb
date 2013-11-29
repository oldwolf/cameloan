# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 201311191517222) do

  create_table "addresses", force: true do |t|
    t.string   "category"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city"
    t.string   "street1"
    t.integer  "street2"
    t.integer  "street3"
    t.text     "full_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id"
  add_index "addresses", ["city"], name: "index_addresses_on_city"
  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id"
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id"

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.integer  "tenant_id"
    t.decimal  "income"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["tenant_id"], name: "index_contacts_on_tenant_id"

  create_table "leads", force: true do |t|
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.text     "contact_address"
    t.decimal  "contact_income"
    t.integer  "contact_age"
    t.integer  "contact_loan_amount"
    t.integer  "contact_loan_period"
    t.string   "status"
    t.integer  "tenant_id"
    t.integer  "loan_scheme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leads", ["loan_scheme_id"], name: "index_leads_on_loan_scheme_id"
  add_index "leads", ["status"], name: "index_leads_on_status"
  add_index "leads", ["tenant_id"], name: "index_leads_on_tenant_id"

  create_table "loan_schemes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "minimum_amount",          default: 0.0,     null: false
    t.decimal  "maximum_amount",          default: 10000.0, null: false
    t.decimal  "interest_rate",           default: 12.0,    null: false
    t.boolean  "is_income_before_tax",    default: true,    null: false
    t.decimal  "minimum_income",          default: 1500.0,  null: false
    t.boolean  "need_income_statement"
    t.integer  "minimum_working_period",  default: 6,       null: false
    t.integer  "working_period_unit_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "minimum_age_requirement", default: 20,      null: false
    t.integer  "maximum_age_requirement", default: 60,      null: false
    t.integer  "loan_period_unit_id"
    t.integer  "minimum_loan_period",     default: 6,       null: false
    t.integer  "maximum_loan_period",     default: 36,      null: false
    t.boolean  "need_mortgage",           default: false,   null: false
    t.boolean  "need_guarantor",          default: false,   null: false
    t.integer  "fastest_approval_day",    default: 3,       null: false
    t.boolean  "publish",                 default: true,    null: false
    t.datetime "published_at"
    t.boolean  "active",                  default: true,    null: false
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loan_schemes", ["city_id"], name: "index_loan_schemes_on_city_id"
  add_index "loan_schemes", ["country_id"], name: "index_loan_schemes_on_country_id"
  add_index "loan_schemes", ["interest_rate"], name: "index_loan_schemes_on_interest_rate"
  add_index "loan_schemes", ["state_id"], name: "index_loan_schemes_on_state_id"
  add_index "loan_schemes", ["tenant_id"], name: "index_loan_schemes_on_tenant_id"

  create_table "loans", force: true do |t|
    t.decimal  "interest_rate"
    t.decimal  "interest_amount"
    t.string   "interest_type"
    t.date     "maturity_date"
    t.integer  "agent_id"
    t.integer  "debtor_id"
    t.integer  "collector_id"
    t.integer  "tenant_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loans", ["agent_id"], name: "index_loans_on_agent_id"
  add_index "loans", ["collector_id"], name: "index_loans_on_collector_id"
  add_index "loans", ["debtor_id"], name: "index_loans_on_debtor_id"
  add_index "loans", ["tenant_id"], name: "index_loans_on_tenant_id"

  create_table "phones", force: true do |t|
    t.string   "phonable_type"
    t.integer  "phonable_id"
    t.string   "category"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phones", ["phonable_id"], name: "index_phones_on_phonable_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "tenants", force: true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["tenant_id"], name: "index_users_on_tenant_id"
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
