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

ActiveRecord::Schema.define(version: 20130608180924) do

  create_table "actions", force: true do |t|
    t.text     "text"
    t.integer  "question_id"
    t.integer  "resource_id"
    t.integer  "pathway_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actions_pathways", force: true do |t|
    t.integer  "action_id"
    t.integer  "pathway_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actions_resources", force: true do |t|
    t.integer  "action_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pathways", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "text"
    t.integer  "pathway_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "starting_weight"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
