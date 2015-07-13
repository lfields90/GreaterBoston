class CreateEventCategoryMemberships < ActiveRecord::Migration
  def change
    create_table :event_category_memberships do |t|
      t.integer :event_id, null: false
      t.integer :event_category_id, null: false

      t.timestamps null: false
    end
  end
end
