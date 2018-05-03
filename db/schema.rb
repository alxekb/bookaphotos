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

ActiveRecord::Schema.define(version: 20180503111259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_photo_sessions", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "photo_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_cities_photo_sessions_on_city_id"
    t.index ["photo_session_id"], name: "index_cities_photo_sessions_on_photo_session_id"
  end

  create_table "covers", force: :cascade do |t|
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.bigint "photo_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_session_id"], name: "index_covers_on_photo_session_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "photo_session_id"
    t.bigint "user_id"
    t.decimal "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_session_id"], name: "index_invoices_on_photo_session_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "langs", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "langs_users", force: :cascade do |t|
    t.bigint "lang_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lang_id"], name: "index_langs_users_on_lang_id"
    t.index ["user_id"], name: "index_langs_users_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "how_to_find"
    t.text "address"
    t.decimal "lat"
    t.decimal "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "photo_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.bigint "session_day_id"
    t.integer "photo_count"
    t.boolean "i_want_to_get_info"
    t.boolean "i_accept_term"
    t.boolean "i_consent_personal_data"
    t.bigint "client_id"
    t.bigint "photographer_id"
    t.boolean "retouch"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["photo_session_id"], name: "index_orders_on_photo_session_id"
    t.index ["photographer_id"], name: "index_orders_on_photographer_id"
    t.index ["session_day_id"], name: "index_orders_on_session_day_id"
  end

  create_table "photo_sessions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.bigint "user_id"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.integer "photos_count"
    t.integer "period_of_execution"
    t.decimal "price_per_photo"
    t.bigint "currency_id"
    t.text "for_whom"
    t.text "preparation"
    t.text "what_to_take"
    t.text "how_route"
    t.text "how_find"
    t.string "lat"
    t.string "lng"
    t.index ["currency_id"], name: "index_photo_sessions_on_currency_id"
    t.index ["user_id"], name: "index_photo_sessions_on_user_id"
  end

  create_table "photo_sessions_themes", force: :cascade do |t|
    t.bigint "photo_session_id"
    t.bigint "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_session_id"], name: "index_photo_sessions_themes_on_photo_session_id"
    t.index ["theme_id"], name: "index_photo_sessions_themes_on_theme_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.bigint "photo_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_session_id"], name: "index_photos_on_photo_session_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "session_days", force: :cascade do |t|
    t.bigint "photo_session_id"
    t.datetime "start_time"
    t.boolean "special"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "currency_id"
    t.index ["currency_id"], name: "index_session_days_on_currency_id"
    t.index ["photo_session_id"], name: "index_session_days_on_photo_session_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "langs_users", "langs"
  add_foreign_key "langs_users", "users"
  add_foreign_key "photo_sessions", "currencies"
  add_foreign_key "profiles", "users"
  add_foreign_key "session_days", "currencies"
end
