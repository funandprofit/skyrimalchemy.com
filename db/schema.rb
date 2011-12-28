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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111228052745) do

  create_table "effects", :force => true do |t|
    t.string   "name"
    t.string   "game_id"
    t.string   "uesp_link"
    t.boolean  "positive",   :default => true, :null => false
    t.integer  "base_value", :default => 0,    :null => false
    t.integer  "magnitude",  :default => 0,    :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "effects_ingredients", :id => false, :force => true do |t|
    t.integer "effect_id"
    t.integer "ingredient_id"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.string   "game_id"
    t.string   "uesp_link"
    t.integer  "base_value", :default => 0,   :null => false
    t.float    "weight",     :default => 0.0, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
