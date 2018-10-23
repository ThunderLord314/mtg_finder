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

ActiveRecord::Schema.define(version: 2018_10_12_161711) do

  create_table "artists", force: :cascade do |t|
    t.string "artist_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cardartists", force: :cascade do |t|
    t.integer "card_id"
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_cardartists_on_artist_id"
    t.index ["card_id"], name: "index_cardartists_on_card_id"
  end

  create_table "cardexpansions", force: :cascade do |t|
    t.integer "card_id"
    t.integer "expansion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cardexpansions_on_card_id"
    t.index ["expansion_id"], name: "index_cardexpansions_on_expansion_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name", null: false
    t.string "artist", null: false
    t.integer "cmc"
    t.string "colors"
    t.string "image", null: false
    t.string "layout"
    t.string "mana_cost"
    t.integer "power"
    t.string "expansions", null: false
    t.string "rarity"
    t.string "text"
    t.integer "toughness"
    t.string "types"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cardtypes", force: :cascade do |t|
    t.integer "card_id"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cardtypes_on_card_id"
    t.index ["type_id"], name: "index_cardtypes_on_type_id"
  end

  create_table "expansions", force: :cascade do |t|
    t.string "expansion_name", null: false
    t.string "short_code", null: false
    t.datetime "release_date", null: false
    t.string "border", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "image_name", null: false
    t.string "path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "type_name", null: false
    t.string "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
