class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.date :birthday
      t.string :name

      t.timestamps
    end

  end
end
