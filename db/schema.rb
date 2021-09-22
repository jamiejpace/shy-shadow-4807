ActiveRecord::Schema.define(version: 2021_09_22_150718) do

  enable_extension "plpgsql"

  create_table "gardens", force: :cascade do |t|
    t.string "name"
    t.boolean "organic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "days_to_harvest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plot_plants", force: :cascade do |t|
    t.bigint "plant_id"
    t.bigint "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_plot_plants_on_plant_id"
    t.index ["plot_id"], name: "index_plot_plants_on_plot_id"
  end

  create_table "plots", force: :cascade do |t|
    t.integer "number"
    t.string "size"
    t.string "direction"
    t.bigint "garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_plots_on_garden_id"
  end

  add_foreign_key "plot_plants", "plants"
  add_foreign_key "plot_plants", "plots"
  add_foreign_key "plots", "gardens"
end
