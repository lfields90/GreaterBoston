class CreateEventFeatureMemberships < ActiveRecord::Migration
  def change
    create_table :event_feature_memberships do |t|
      t.integer :event_id
      t.integer :event_feature_id

      t.timestamps null: false
    end
  end
end
