# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_30_205129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "country"
    t.string "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "addressable_id"
    t.string "addressable_type"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "inventory_item_id", null: false
    t.text "content"
    t.string "user_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_item_id"], name: "index_comments_on_inventory_item_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.decimal "unit_cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "subtitle"
    t.text "images", default: [], array: true
    t.text "thumb_image"
    t.string "slug"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_inventory_items_on_category_id"
    t.index ["slug"], name: "index_inventory_items_on_slug", unique: true
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.bigint "inventory_item_id", null: false
    t.bigint "shopping_cart_id", null: false
    t.integer "quantity", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "style", default: ""
    t.index ["inventory_item_id"], name: "index_shopping_cart_items_on_inventory_item_id"
    t.index ["shopping_cart_id"], name: "index_shopping_cart_items_on_shopping_cart_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.string "name"
    t.datetime "purchased_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.boolean "billing_same_as_shipping", default: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "color"
    t.string "stone"
    t.string "length"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "inventory_item_id"
    t.index ["inventory_item_id"], name: "index_styles_on_inventory_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.string "roles"
    t.boolean "guest", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "inventory_items"
  add_foreign_key "inventory_items", "categories"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "styles", "inventory_items"
end
