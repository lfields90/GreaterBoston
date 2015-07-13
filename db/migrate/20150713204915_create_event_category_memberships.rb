class CreateEventCategoryMemberships < ActiveRecord::Migration
  def change
    create_table :event_category_memberships do |t|
      t.integer :event_id
      t.integer :event_category_id

      t.timestamps null: false
    end
  end
end
