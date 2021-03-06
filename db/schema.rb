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

ActiveRecord::Schema.define(version: 20170220065609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

  create_table "ahoy_events", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.jsonb    "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time", using: :btree
    t.index ["user_id", "name"], name: "index_ahoy_events_on_user_id_and_name", using: :btree
    t.index ["visit_id", "name"], name: "index_ahoy_events_on_visit_id_and_name", using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.string "file_name"
    t.string "file_size"
    t.string "file_type"
    t.string "attachment"
    t.text   "content"
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content_html"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "ideas", force: :cascade do |t|
    t.text "content"
  end

  create_table "image_arrays", force: :cascade do |t|
    t.string "image_array", default: [], array: true
    t.string "file_names",  default: [], array: true
    t.string "file_sizes",  default: [], array: true
    t.string "file_types",  default: [], array: true
    t.text   "content"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "actor_id"
    t.datetime "read_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "notify_type"
    t.integer  "status_id"
    t.index ["status_id"], name: "index_notifications_on_status_id", using: :btree
    t.index ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "desc"
    t.string   "avatar"
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "publications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "content_html"
    t.integer  "publishable_id"
    t.string   "publishable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["project_id"], name: "index_publications_on_project_id", using: :btree
    t.index ["publishable_id", "publishable_type"], name: "index_publications_on_publishable_id_and_publishable_type", using: :btree
    t.index ["user_id"], name: "index_publications_on_user_id", using: :btree
  end

  create_table "relations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "action_type"
    t.string   "relationable_type"
    t.integer  "relationable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["action_type"], name: "index_relations_on_action_type", using: :btree
    t.index ["relationable_type", "relationable_id"], name: "index_relations_on_relationable_type_and_relationable_id", using: :btree
    t.index ["user_id"], name: "index_relations_on_user_id", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "action_type"
    t.text     "content"
    t.integer  "statusable_id"
    t.string   "statusable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["project_id"], name: "index_statuses_on_project_id", using: :btree
    t.index ["statusable_id", "statusable_type"], name: "index_statuses_on_statusable_id_and_statusable_type", using: :btree
    t.index ["statusable_type"], name: "index_statuses_on_statusable_type", using: :btree
    t.index ["user_id"], name: "index_statuses_on_user_id", using: :btree
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "homepage"
    t.string   "location"
    t.integer  "gender",            default: 0
    t.text     "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "domain_updated_at"
    t.datetime "name_updated_at"
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "last_seen"
    t.integer  "role",                   default: 0
    t.string   "name"
    t.string   "domain"
    t.string   "avatar"
    t.index ["domain"], name: "index_users_on_domain", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "visits", force: :cascade do |t|
    t.string   "visit_token"
    t.string   "visitor_token"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_visits_on_user_id", using: :btree
    t.index ["visit_token"], name: "index_visits_on_visit_token", unique: true, using: :btree
  end

  add_foreign_key "publications", "projects"
  add_foreign_key "publications", "users"
  add_foreign_key "user_profiles", "users"
end
