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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110625133332) do

  create_table "cechas", :force => true do |t|
    t.string   "nazwa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "pytanie"
  end

  create_table "rasas", :force => true do |t|
    t.string   "nazwa"
    t.string   "opis"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stopiens", :force => true do |t|
    t.float    "dopasowanie"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "cecha_id"
    t.integer  "rasa_id"
  end

  add_index "stopiens", ["cecha_id"], :name => "index_stopiens_on_cecha_id"
  add_index "stopiens", ["rasa_id"], :name => "index_stopiens_on_rasa_id"
  add_index "stopiens", ["user_id"], :name => "index_stopiens_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
