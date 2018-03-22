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

ActiveRecord::Schema.define(version: 20180322123213) do

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "name"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.text "iso_code_alpha_2"
    t.integer "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_weather_conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "city_weather_id"
    t.bigint "weather_condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_weather_id"], name: "index_city_weather_conditions_on_city_weather_id"
    t.index ["weather_condition_id"], name: "index_city_weather_conditions_on_weather_condition_id"
  end

  create_table "city_weathers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "city_id"
    t.float "temperature", limit: 24
    t.float "temperature_minimum", limit: 24
    t.float "temperature_maximum", limit: 24
    t.string "pressure_sea_level_default"
    t.float "pressure_seal_level", limit: 24
    t.float "pressure_ground_level", limit: 24
    t.string "humidity"
    t.float "cloudiness_percentage", limit: 24
    t.float "wind_speed", limit: 24
    t.float "wind_degree", limit: 24
    t.float "rain_volume", limit: 24
    t.float "snow_volume", limit: 24
    t.datetime "time_of_data_forecasted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id", "time_of_data_forecasted"], name: "index_city_weathers_on_city_id_and_time_of_data_forecasted", unique: true
    t.index ["city_id"], name: "index_city_weathers_on_city_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weather_condition_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_weather_condition_groups_on_name", unique: true
  end

  create_table "weather_conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "weather_condition_group_id"
    t.text "description"
    t.text "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_condition_group_id"], name: "index_weather_conditions_on_weather_condition_group_id"
  end

end
