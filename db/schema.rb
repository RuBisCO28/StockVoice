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

ActiveRecord::Schema[7.0].define(version: 2022_05_08_105506) do
  create_table "cashflows", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ticker", null: false
    t.string "fiscal_period", null: false
    t.string "cfo", null: false
    t.string "cfi", null: false
    t.string "cff", null: false
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ticker", null: false
    t.string "japanese"
    t.string "english"
    t.string "country", null: false
    t.string "market"
    t.string "sector_id", null: false
    t.string "fiscal_period"
    t.text "japanese_description"
    t.text "english_description"
  end

  create_table "profit_losses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ticker", null: false
    t.string "fiscal_period", null: false
    t.string "net_sales", null: false
    t.string "net_operating_profit", null: false
    t.string "ordinary_profit", null: false
    t.string "net_profit", null: false
    t.string "roe", null: false
  end

  create_table "sectors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "japanese", null: false
    t.string "english", null: false
    t.string "country", null: false
  end

  create_table "stocks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ticker", null: false
    t.string "trade_date", null: false
    t.integer "open", null: false
    t.integer "high", null: false
    t.integer "low", null: false
    t.integer "close", null: false
    t.integer "volume", null: false
  end

end
