class CreateEventCategoryMemberships < ActiveRecord::Migration
  def change
    create_table :event_category_memberships do |t|
      t.belongs_to :event, null: false
      t.belongs_to :event_category, null: false

      t.timestamps null: false
    end
  end
end
