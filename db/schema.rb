ActiveRecord::Schema[7.0].define(version: 2023_12_20_123640) do
  create_table "users", force: :cascade do |t|
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
