class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.boolean :color
      t.string :type
      t.boolean :sliding
      t.string :state
      t.integer :x
      t.integer :y
      t.integer :game_id
      t.integer :player_id

      t.timestamps
    end
  end
end
