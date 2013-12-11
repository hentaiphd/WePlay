class CreateEventsGames < ActiveRecord::Migration
  def change
    create_table :events_games, :id => false do |t|
      t.integer :game_id
      t.integer :event_id
    end
  end
end