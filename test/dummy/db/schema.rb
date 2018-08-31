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

ActiveRecord::Schema.define(version: 2015_01_31_170613) do

  create_table "boolean_models", force: :cascade do |t|
    t.boolean "boolean_field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enum_models", force: :cascade do |t|
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lexicons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "numeric_models", force: :cascade do |t|
    t.integer "integer_field"
    t.decimal "decimal_field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string "type"
    t.string "field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "the_answers", force: :cascade do |t|
    t.string "ultimate_truth"
    t.integer "lexicon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lexicon_id"], name: "index_the_answers_on_lexicon_id"
  end

end
