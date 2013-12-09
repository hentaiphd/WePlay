class CreateAttendee < ActiveRecord::Migration
  def change
    create_table :attendee do |t|
      t.references :event, index: true
      t.references :user, index: true
      t.boolean :organizer

      t.timestamps
    end
  end
end
