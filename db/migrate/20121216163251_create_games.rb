class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :started_at

      t.timestamps
    end
  end
end
