class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :state, default: "pending"
      t.integer :turn, default: 0
      t.string :result, default: "0-0"
      t.integer :winning_player_id
      t.integer :draw_offerer_id

      t.timestamps
    end
  end
end
