class HoboMigration1 < ActiveRecord::Migration
  def self.up
    rename_table :swiats, :rasas

    rename_column :stopiens, :swiat_id, :rasa_id

    remove_index :stopiens, :name => :index_stopiens_on_swiat_id rescue ActiveRecord::StatementInvalid
    add_index :stopiens, [:rasa_id]
  end

  def self.down
    rename_column :stopiens, :rasa_id, :swiat_id

    rename_table :rasas, :swiats

    remove_index :stopiens, :name => :index_stopiens_on_rasa_id rescue ActiveRecord::StatementInvalid
    add_index :stopiens, [:swiat_id]
  end
end
