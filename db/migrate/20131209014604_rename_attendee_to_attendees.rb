class RenameAttendeeToAttendees < ActiveRecord::Migration
  def change
    rename_table :attendee, :attendees
  end
end
