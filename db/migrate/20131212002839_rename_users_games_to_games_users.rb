class RenameUsersGamesToGamesUsers < ActiveRecord::Migration
  def change
    rename_table :users_games, :games_users
  end
end
