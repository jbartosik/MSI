class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :dopasowanies do |t|
      t.float    :dopasowanie
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :cecha_id
      t.integer  :swiat_id
    end
    add_index :dopasowanies, [:user_id]
    add_index :dopasowanies, [:cecha_id]
    add_index :dopasowanies, [:swiat_id]

    create_table :cechas do |t|
      t.string   :nazwa
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :name
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state, :default => "active"
      t.datetime :key_timestamp
    end
    add_index :users, [:state]

    create_table :swiats do |t|
      t.string   :nazwa
      t.string   :opis
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :dopasowanies
    drop_table :cechas
    drop_table :users
    drop_table :swiats
  end
end
