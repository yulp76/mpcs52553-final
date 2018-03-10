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

ActiveRecord::Schema.define(version: 0) do

  create_table "attractions", force: :cascade do |t|
    t.text "name"
    t.integer "destination_id"
    t.integer "category_id"
    t.text "image_url"
    t.text "address"
    t.text "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_attractions_on_category_id"
    t.index ["destination_id"], name: "index_attractions_on_destination_id"
  end

  create_table "categories", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destinations", force: :cascade do |t|
    t.text "name"
    t.text "introduction"
    t.text "cover_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.integer "user_id"
    t.integer "attraction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attraction_id"], name: "index_reviews_on_attraction_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.text "email"
    t.boolean "admin", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "password_digest"
  end

  create_table "wishes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "attraction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attraction_id"], name: "index_wishes_on_attraction_id"
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

end
