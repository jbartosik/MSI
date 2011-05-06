class HoboMigration2 < ActiveRecord::Migration
  def self.up
    rename_table :dopasowanies, :stopiens

    remove_index :stopiens, :name => :index_dopasowanies_on_swiat_id rescue ActiveRecord::StatementInvalid
    remove_index :stopiens, :name => :index_dopasowanies_on_cecha_id rescue ActiveRecord::StatementInvalid
    remove_index :stopiens, :name => :index_dopasowanies_on_user_id rescue ActiveRecord::StatementInvalid
    add_index :stopiens, [:user_id]
    add_index :stopiens, [:cecha_id]
    add_index :stopiens, [:swiat_id]
  end

  def self.down
    rename_table :stopiens, :dopasowanies

    remove_index :dopasowanies, :name => :index_stopiens_on_user_id rescue ActiveRecord::StatementInvalid
    remove_index :dopasowanies, :name => :index_stopiens_on_cecha_id rescue ActiveRecord::StatementInvalid
    remove_index :dopasowanies, :name => :index_stopiens_on_swiat_id rescue ActiveRecord::StatementInvalid
    add_index :dopasowanies, [:swiat_id]
    add_index :dopasowanies, [:cecha_id]
    add_index :dopasowanies, [:user_id]
  end
end
