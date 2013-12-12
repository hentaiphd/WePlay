class AddUserIdToGamesUsers < ActiveRecord::Migration
  def change
    add_column :games_users, :user_id, :integer
    remove_column :games_users, :event_id
  end
end
