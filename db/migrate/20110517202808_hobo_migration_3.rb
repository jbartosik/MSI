class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :cechas, :pytanie, :text
  end

  def self.down
    remove_column :cechas, :pytanie
  end
end
