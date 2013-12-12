class CreateUsersGames < ActiveRecord::Migration
  def change
    create_table :users_games, :id => false do |t|
      t.integer :game_id
      t.integer :event_id
    end
  end
end
