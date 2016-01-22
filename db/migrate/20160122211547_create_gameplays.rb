class CreateGameplays < ActiveRecord::Migration
  def change
    create_table :gameplays do |t|
      t.integer :player_id, null: false
      t.integer :game_id, null: false
      t.boolean :color, default: false

      t.timestamps
    end
  end
end
