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

ActiveRecord::Schema.define(version: 2021_02_17_162122) do

  create_table "insults", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "targets", force: :cascade do |t|
    t.string "prey"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tweet_insults", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tweet_id", null: false
    t.integer "insult_id", null: false
    t.index ["insult_id"], name: "index_tweet_insults_on_insult_id"
    t.index ["tweet_id"], name: "index_tweet_insults_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.datetime "date"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "target_id", null: false
    t.index ["target_id"], name: "index_tweets_on_target_id"
  end

  add_foreign_key "tweet_insults", "insults"
  add_foreign_key "tweet_insults", "tweets"
  add_foreign_key "tweets", "targets"
end
