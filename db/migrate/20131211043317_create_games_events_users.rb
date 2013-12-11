class CreateGamesEventsUsers < ActiveRecord::Migration
  def change
    create_table :games_events_users do |t|
      t.integer :game_id
      t.integer :event_id
      t.integer :user_id
    end
  end
end
