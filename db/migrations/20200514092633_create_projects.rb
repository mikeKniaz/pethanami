Hanami::Model.migration do
  change do
    create_table :projects do
      primary_key :id

      foreign_key :user_id, :users, null: false, on_delete: :cascade

      column :name, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
