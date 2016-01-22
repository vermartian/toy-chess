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

ActiveRecord::Schema.define(version: 20160122211547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gameplays", force: :cascade do |t|
    t.integer  "player_id",                  null: false
    t.integer  "game_id",                    null: false
    t.boolean  "color",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.string   "state",             default: "pending"
    t.integer  "turn",              default: 0
    t.string   "result",            default: "0-0"
    t.integer  "winning_player_id"
    t.integer  "draw_offerer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pieces", force: :cascade do |t|
    t.boolean  "color"
    t.string   "type"
    t.boolean  "sliding",    default: false
    t.string   "state",      default: "off"
    t.integer  "x"
    t.integer  "y"
    t.integer  "game_id",                    null: false
    t.integer  "player_id",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: :cascade do |t|
    t.string   "user_name",  null: false
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
