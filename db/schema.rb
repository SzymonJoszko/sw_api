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

ActiveRecord::Schema[7.0].define(version: 2023_05_09_071450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "films", id: false, force: :cascade do |t|
    t.integer "id", null: false
    t.json "data_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_films_on_id", unique: true
  end

  create_table "people", id: false, force: :cascade do |t|
    t.integer "id", null: false
    t.json "data_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_people_on_id", unique: true
  end

  create_table "planets", id: false, force: :cascade do |t|
    t.integer "id", null: false
    t.json "data_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_planets_on_id", unique: true
  end

  create_table "species", id: false, force: :cascade do |t|
    t.integer "id", null: false
    t.json "data_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_species_on_id", unique: true
  end

  create_table "starships", id: false, force: :cascade do |t|
    t.integer "id", null: false
    t.json "data_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_starships_on_id", unique: true
  end

  create_table "table_update_infos", force: :cascade do |t|
    t.string "t_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["t_name"], name: "index_table_update_infos_on_t_name", unique: true
  end

  create_table "vehicles", id: false, force: :cascade do |t|
    t.integer "id", null: false
    t.json "data_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_vehicles_on_id", unique: true
  end

end
