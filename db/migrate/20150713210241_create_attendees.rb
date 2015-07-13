class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.belongs_to :event, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
