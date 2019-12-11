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

ActiveRecord::Schema.define(version: 2019_12_11_100721) do

  create_table "answers", force: :cascade do |t|
    t.integer "answer_type"
    t.string "text"
    t.integer "priority"
    t.boolean "locked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "answers_question_templates", id: false, force: :cascade do |t|
    t.integer "question_template_id"
    t.integer "answer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_answers_question_templates_on_answer_id"
    t.index ["question_template_id"], name: "index_answers_question_templates_on_question_template_id"
  end

  create_table "form_templates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "form_templates_questions", id: false, force: :cascade do |t|
    t.integer "form_template_id", null: false
    t.integer "question_id", null: false
    t.index ["question_id", "form_template_id"], name: "form_template_question_index"
  end

  create_table "majors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "majors_professors", id: false, force: :cascade do |t|
    t.integer "major_id", null: false
    t.integer "professor_id", null: false
    t.index ["professor_id", "major_id"], name: "index_majors_professors_on_professor_id_and_major_id"
  end

  create_table "majors_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "major_id", null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "question_templates", force: :cascade do |t|
    t.string "name"
    t.boolean "locked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.integer "priority"
    t.integer "question_template_id", null: false
    t.integer "question_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_template_id"], name: "index_questions_on_question_template_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "questions", "question_templates"
end
