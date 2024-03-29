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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130821030213) do

  create_table "addresses", :force => true do |t|
    t.string  "street_line_1"
    t.string  "street_line_2"
    t.string  "zip_code"
    t.string  "city"
    t.string  "state"
    t.string  "country"
    t.integer "person_id"
  end

  create_table "people", :force => true do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "gender"
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
  end

end
