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

ActiveRecord::Schema.define(version: 2019_12_10_204837) do

  create_table "answers", force: :cascade do |t|
    t.integer "answer_type"
    t.string "text"
    t.integer "priority"
    t.boolean "locked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "question_templates", force: :cascade do |t|
    t.string "name"
    t.integer "locked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "question_templates_anwers", id: false, force: :cascade do |t|
    t.integer "question_template_id"
    t.integer "answer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_question_templates_anwers_on_answer_id"
    t.index ["question_template_id"], name: "index_question_templates_anwers_on_question_template_id"
  end

end
