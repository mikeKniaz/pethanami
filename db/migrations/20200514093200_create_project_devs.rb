Hanami::Model.migration do
  change do
    create_table :project_devs do
      primary_key :id

      foreign_key :user_id,    :users,    null: false, on_delete: :cascade
      foreign_key :project_id, :projects, null: false, on_delete: :cascade

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
