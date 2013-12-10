class RenameEventsUsersTable < ActiveRecord::Migration
  def change
    rename_table :users_and_events, :events_users
  end
end
