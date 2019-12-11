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

ActiveRecord::Schema.define(version: 2019_12_11_151900) do

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

  create_table "ccrs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ccrs_majors", id: false, force: :cascade do |t|
    t.integer "major_id", null: false
    t.integer "ccr_id", null: false
  end

  create_table "form_applications", force: :cascade do |t|
    t.integer "semester_id", null: false
    t.integer "form_template_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["form_template_id"], name: "index_form_applications_on_form_template_id"
    t.index ["semester_id"], name: "index_form_applications_on_semester_id"
  end

  create_table "form_applications_reports", id: false, force: :cascade do |t|
    t.integer "report_id", null: false
    t.integer "form_application_id", null: false
  end

  create_table "form_submissions", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "form_application_id", null: false
    t.integer "professor_id", null: false
    t.integer "offer_id", null: false
    t.integer "answer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "text"
    t.index ["answer_id"], name: "index_form_submissions_on_answer_id"
    t.index ["form_application_id"], name: "index_form_submissions_on_form_application_id"
    t.index ["offer_id"], name: "index_form_submissions_on_offer_id"
    t.index ["professor_id"], name: "index_form_submissions_on_professor_id"
    t.index ["question_id"], name: "index_form_submissions_on_question_id"
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

  create_table "offers", force: :cascade do |t|
    t.integer "ccr_id", null: false
    t.integer "major_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ccr_id"], name: "index_offers_on_ccr_id"
    t.index ["major_id"], name: "index_offers_on_major_id"
  end

  create_table "offers_professors", id: false, force: :cascade do |t|
    t.integer "professor_id", null: false
    t.integer "offer_id", null: false
  end

  create_table "offers_semesters", id: false, force: :cascade do |t|
    t.integer "semester_id", null: false
    t.integer "offer_id", null: false
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

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "semesters", force: :cascade do |t|
    t.string "name"
    t.integer "major_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["major_id"], name: "index_semesters_on_major_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "form_applications", "form_templates"
  add_foreign_key "form_applications", "semesters"
  add_foreign_key "form_submissions", "answers"
  add_foreign_key "form_submissions", "form_applications"
  add_foreign_key "form_submissions", "offers"
  add_foreign_key "form_submissions", "professors"
  add_foreign_key "form_submissions", "questions"
  add_foreign_key "offers", "ccrs"
  add_foreign_key "offers", "majors"
  add_foreign_key "questions", "question_templates"
  add_foreign_key "semesters", "majors"
end
