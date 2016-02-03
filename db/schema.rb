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

ActiveRecord::Schema.define(version: 20160203105005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.integer  "vasarian_age"
    t.integer  "name_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "teacher_id"
  end

  add_index "artists", ["name_id"], name: "index_artists_on_name_id", using: :btree

  create_table "artwork", force: :cascade do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.string   "medium"
    t.string   "image_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "question_id"
    t.integer  "locatable_id"
    t.string   "locatable_type"
  end

  add_index "artwork", ["artist_id"], name: "index_artwork_on_artist_id", using: :btree
  add_index "artwork", ["locatable_type", "locatable_id"], name: "index_artwork_on_locatable_type_and_locatable_id", using: :btree
  add_index "artwork", ["question_id"], name: "index_artwork_on_question_id", using: :btree

  create_table "artworks", force: :cascade do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.string   "medium"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artworks", ["artist_id"], name: "index_artworks_on_artist_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "alternative_name"
    t.integer  "region_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "cities", ["region_id"], name: "index_cities_on_region_id", using: :btree

  create_table "dates_with_possible_ambiguity", force: :cascade do |t|
    t.integer  "date"
    t.boolean  "approximation"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "dateable_id"
    t.string   "dateable_type"
    t.string   "dateable_field_name"
  end

  add_index "dates_with_possible_ambiguity", ["dateable_type", "dateable_id"], name: "ambiguous_dates_index", using: :btree

  create_table "names", force: :cascade do |t|
    t.string   "first"
    t.string   "last"
    t.string   "title"
    t.string   "middle"
    t.string   "full"
    t.string   "common"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "names", ["artist_id"], name: "index_names_on_artist_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "alternative_name"
    t.integer  "city_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "places", ["city_id"], name: "index_places_on_city_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["test_id"], name: "index_questions_on_test_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "alternative_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "response_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "answer"
    t.boolean  "correct"
  end

  add_index "responses", ["question_id"], name: "index_responses_on_question_id", using: :btree

  create_table "test_configurations", force: :cascade do |t|
    t.integer  "name_style"
    t.integer  "artist_style"
    t.integer  "year_style"
    t.integer  "test_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "test_configurations", ["test_id"], name: "index_test_configurations_on_test_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "artists", "names"
  add_foreign_key "artwork", "artists"
  add_foreign_key "artwork", "questions"
  add_foreign_key "artworks", "artists"
  add_foreign_key "cities", "regions"
  add_foreign_key "places", "cities"
  add_foreign_key "questions", "tests"
  add_foreign_key "responses", "questions"
  add_foreign_key "test_configurations", "tests"
end
