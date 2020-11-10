# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_09_211149) do

  create_table "array_models", force: :cascade do |t|
    t.string "currencies"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
