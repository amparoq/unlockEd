# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_09_040620) do
  create_table "alternative_questions", force: :cascade do |t|
    t.integer "difficulty"
    t.integer "module"
    t.string "question"
    t.string "alternative_a"
    t.string "alternative_b"
    t.string "alternative_c"
    t.string "alternative_a_answer"
    t.string "alternative_b_answer"
    t.string "alternative_c_answer"
    t.boolean "answer_a_show", default: false
    t.boolean "answer_b_show", default: false
    t.boolean "answer_c_show", default: false
    t.string "correct_alternative"
    t.integer "error_counter", default: -1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_user_alternative_questions", force: :cascade do |t|
    t.integer "attempts"
    t.integer "order_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "task_id", null: false
    t.integer "alternative_question_id", null: false
    t.index ["alternative_question_id"], name: "index_join_user_alternative_questions_on_alternative_question_id"
    t.index ["task_id"], name: "index_join_user_alternative_questions_on_task_id"
    t.index ["user_id"], name: "index_join_user_alternative_questions_on_user_id"
  end

  create_table "join_user_numerical_questions", force: :cascade do |t|
    t.integer "attempts"
    t.integer "order_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "task_id", null: false
    t.integer "alternative_question_id", null: false
    t.index ["alternative_question_id"], name: "index_join_user_numerical_questions_on_alternative_question_id"
    t.index ["task_id"], name: "index_join_user_numerical_questions_on_task_id"
    t.index ["user_id"], name: "index_join_user_numerical_questions_on_user_id"
  end

  create_table "numerical_questions", force: :cascade do |t|
    t.integer "difficulty"
    t.integer "module"
    t.string "question"
    t.string "answer"
    t.string "hint"
    t.string "domain"
    t.boolean "alter_domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "number"
    t.integer "status"
    t.integer "correct_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_question_values", force: :cascade do |t|
    t.string "value_name"
    t.float "value"
    t.string "statement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "numerical_question_id", null: false
    t.integer "user_id", null: false
    t.index ["numerical_question_id"], name: "index_user_question_values_on_numerical_question_id"
    t.index ["user_id"], name: "index_user_question_values_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.float "user_level"
    t.integer "streak"
    t.integer "module"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "join_user_alternative_questions", "alternative_questions"
  add_foreign_key "join_user_alternative_questions", "tasks"
  add_foreign_key "join_user_alternative_questions", "users"
  add_foreign_key "join_user_numerical_questions", "alternative_questions"
  add_foreign_key "join_user_numerical_questions", "tasks"
  add_foreign_key "join_user_numerical_questions", "users"
  add_foreign_key "tasks", "users"
  add_foreign_key "user_question_values", "numerical_questions"
  add_foreign_key "user_question_values", "users"
end
