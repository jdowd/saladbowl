class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :game_id

      t.timestamps
    end
    add_index :teams, :game_id
  end
end
