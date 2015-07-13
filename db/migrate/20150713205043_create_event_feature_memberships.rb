class CreateEventFeatureMemberships < ActiveRecord::Migration
  def change
    create_table :event_feature_memberships do |t|
      t.integer :event_id, null: false
      t.integer :event_feature_id, null: false

      t.timestamps null: false
    end
  end
end
