Hanami::Model.migration do
  change do

    extension :pg_enum
    create_enum :positions, %w(dev pm qa)

    create_table :users do
      primary_key :id

      column :name,     String,      null: false, unique: true
      column :password, String,      null: false, default: 'password'
      column :position, 'positions', null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
