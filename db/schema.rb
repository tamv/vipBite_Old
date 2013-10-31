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

ActiveRecord::Schema.define(version: 3) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "details", force: true do |t|
    t.string "detailId"
    t.text   "promo"
    t.text   "promoDetail"
    t.string "reservation"
    t.string "detaillink"
    t.text   "comment"
    t.string "imgFolder"
    t.string "urbanspoon"
  end

  create_table "restaurants", force: true do |t|
    t.string   "restaurantname"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "postal"
    t.string   "imageUrl"
    t.string   "email"
    t.string   "phone"
    t.string   "operatinghour"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "detailId"
    t.string   "tags"
    t.datetime "modifieddate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.string   "transactionId"
    t.string   "userId"
    t.string   "subscription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "userId"
    t.string   "login"
    t.string   "firstName"
    t.string   "lastName"
    t.boolean  "isAdmin"
    t.string   "password"
    t.datetime "expDate"
  end

end
