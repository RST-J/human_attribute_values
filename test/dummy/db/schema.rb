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

ActiveRecord::Schema.define(version: 20150131170613) do

  create_table "boolean_models", force: true do |t|
    t.boolean  "boolean_field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enum_models", force: true do |t|
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lexicons", force: true do |t|
    t.integer  "the_answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lexicons", ["the_answer_id"], name: "index_lexicons_on_the_answer_id"

  create_table "numeric_models", force: true do |t|
    t.integer  "integer_field"
    t.decimal  "decimal_field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents", force: true do |t|
    t.string   "type"
    t.string   "field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "the_answers", force: true do |t|
    t.string   "ultimate_truth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
