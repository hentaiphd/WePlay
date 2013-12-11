class CreateGames < ActiveRecord::Migration
  def change
    drop_table :games
    create_table :games do |t|
      t.string :name

      t.timestamps
    end
  end
end
