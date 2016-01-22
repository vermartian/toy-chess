class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :user_name, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
