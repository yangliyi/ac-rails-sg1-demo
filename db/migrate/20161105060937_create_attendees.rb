class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.string :name
      t.integer :event_id

      t.timestamps
    end
    add_index :attendees, :event_id
  end
end
