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

ActiveRecord::Schema.define(:version => 20111107021228) do

  create_table "assistants", :force => true do |t|
    t.integer  "person_id"
    t.integer  "group_id"
    t.integer  "svc_month"
    t.integer  "week_preferred"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assistants", ["group_id"], :name => "index_assistants_on_group_id"
  add_index "assistants", ["person_id"], :name => "index_assistants_on_person_id"

  create_table "families", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "min_age"
    t.integer  "max_age"
    t.string   "service"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "work_phone"
    t.string   "email"
    t.string   "preferred_contact_method"
    t.string   "gender_identification"
    t.date     "birthdate"
    t.boolean  "active"
    t.text     "public_note"
    t.text     "admin_note"
    t.string   "family_role"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["family_id"], :name => "index_people_on_family_id"

  create_table "students", :force => true do |t|
    t.integer  "person_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["group_id"], :name => "index_students_on_group_id"
  add_index "students", ["person_id"], :name => "index_students_on_person_id"

  create_table "teachers", :force => true do |t|
    t.integer  "person_id"
    t.integer  "group_id"
    t.integer  "svc_month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["group_id"], :name => "index_teachers_on_group_id"
  add_index "teachers", ["person_id"], :name => "index_teachers_on_person_id"

end
