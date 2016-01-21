class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.boolean :color
      t.string :type
      t.boolean :sliding, default: false
      t.string :state, default: "off"
      t.integer :x
      t.integer :y
      t.integer :game_id, null: false
      t.integer :player_id, null: false

      t.timestamps
    end
  end
end
