class RemoveIdFromEventsUsers < ActiveRecord::Migration
  def change
    remove_column :events_users, :id, :integer
  end
end
