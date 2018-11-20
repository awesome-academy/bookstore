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

ActiveRecord::Schema.define(version: 2018_11_16_101026) do

  create_table "author_books", force: :cascade do |t|
    t.integer "book_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "author"
    t.string "date"
    t.string "description"
    t.string "auth_link"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_blogs_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "publisher"
    t.float "price"
    t.integer "quantity_in_store"
    t.string "image"
    t.text "description"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity"
    t.float "paideach"
    t.integer "cart_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["book_id"], name: "index_cart_items_on_book_id"
    t.index ["cart_id", "book_id"], name: "index_cart_items_on_cart_id_and_book_id", unique: true
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emotions", force: :cascade do |t|
    t.boolean "like"
    t.boolean "dislike"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_emotions_on_book_id"
    t.index ["user_id", "book_id"], name: "index_emotions_on_user_id_and_book_id", unique: true
    t.index ["user_id"], name: "index_emotions_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "phone_number"
    t.string "address"
    t.float "total"
    t.datetime "date"
    t.integer "cart_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "dob"
    t.integer "payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "followed_id"
    t.integer "follower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.datetime "dob"
    t.string "avatar"
    t.integer "payment_id"
    t.boolean "admin", default: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
