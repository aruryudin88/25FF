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

ActiveRecord::Schema.define(version: 20160213194010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinematographs", force: :cascade do |t|
    t.string   "name",       limit: 35
    t.string   "surename",   limit: 35
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "cinematographs_films", id: false, force: :cascade do |t|
    t.integer "film_id",          null: false
    t.integer "cinematograph_id", null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string   "name",       limit: 35
    t.string   "surename",   limit: 35
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "distributors", force: :cascade do |t|
    t.string   "name",       limit: 70
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "editors", force: :cascade do |t|
    t.string   "name",       limit: 35
    t.string   "surename",   limit: 35
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "films", force: :cascade do |t|
    t.string   "name",         limit: 70
    t.text     "description"
    t.date     "premiere"
    t.date     "usa_premiere"
    t.string   "genre",        limit: 35
    t.integer  "running_time"
    t.string   "country",      limit: 35
    t.string   "language",     limit: 35
    t.money    "budget",                  scale: 2
    t.money    "box_office",              scale: 2
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "file_path",    limit: 70
  end

  create_table "films_directors", id: false, force: :cascade do |t|
    t.integer "film_id",     null: false
    t.integer "director_id", null: false
  end

  create_table "films_distributors", id: false, force: :cascade do |t|
    t.integer "film_id",        null: false
    t.integer "distributor_id", null: false
  end

  create_table "films_editors", id: false, force: :cascade do |t|
    t.integer "film_id",   null: false
    t.integer "editor_id", null: false
  end

  create_table "films_musicans", id: false, force: :cascade do |t|
    t.integer "film_id",    null: false
    t.integer "musican_id", null: false
  end

  create_table "films_producers", id: false, force: :cascade do |t|
    t.integer "film_id",     null: false
    t.integer "producer_id", null: false
  end

  create_table "films_production_companies", id: false, force: :cascade do |t|
    t.integer "film_id",               null: false
    t.integer "production_company_id", null: false
  end

  create_table "films_stars", id: false, force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "star_id", null: false
  end

  create_table "films_storytellers", id: false, force: :cascade do |t|
    t.integer "film_id",        null: false
    t.integer "storyteller_id", null: false
  end

  create_table "films_writers", id: false, force: :cascade do |t|
    t.integer "film_id",   null: false
    t.integer "writer_id", null: false
  end

  create_table "locale_names", force: :cascade do |t|
    t.string   "tag",        limit: 7
    t.string   "name",       limit: 70
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "musicans", force: :cascade do |t|
    t.string   "name",       limit: 35
    t.string   "surename",   limit: 35
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "producers", force: :cascade do |t|
    t.string   "name",       limit: 35
    t.string   "surename",   limit: 35
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "production_companies", force: :cascade do |t|
    t.string   "name",       limit: 70
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "stars", force: :cascade do |t|
    t.string   "name",       limit: 35
    t.string   "surename",   limit: 35
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "storytellers", force: :cascade do |t|
    t.string   "name",       limit: 35
    t.string   "surename",   limit: 35
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 32
    t.string   "password"
    t.datetime "login_at"
    t.string   "head"
    t.string   "eyes"
    t.string   "nose"
    t.string   "mouth"
    t.string   "ears"
    t.string   "hair"
    t.string   "firstname",  limit: 35
    t.string   "lastname",   limit: 35
    t.date     "dob"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "writers", force: :cascade do |t|
    t.string   "name",       limit: 35
    t.string   "surename",   limit: 35
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
