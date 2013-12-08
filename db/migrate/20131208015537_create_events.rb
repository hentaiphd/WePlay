class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :start
      t.datetime :end
      t.references :user, index: true
      t.references :game, index: true

      t.timestamps
    end
  end
end
