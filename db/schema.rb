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

ActiveRecord::Schema.define(version: 20150603122940) do

  create_table "comments", force: true do |t|
    t.string  "text"
    t.string  "name"
    t.integer "list_id"
    t.date    "date_time"
    t.string  "file_name"
  end

  create_table "lists", force: true do |t|
    t.string  "title"
    t.string  "starter"
    t.integer "project_id"
    t.date    "date_time"
  end

  create_table "projects", force: true do |t|
    t.string "title"
    t.string "description"
    t.string "location"
    t.string "founder"
    t.string "img_file"
  end

  create_table "users", force: true do |t|
    t.string  "username"
    t.string  "password_digest"
    t.string  "salt"
    t.integer "color1"
    t.integer "color2"
    t.integer "color3"
  end

end