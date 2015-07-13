class CreateEventFeatureMemberships < ActiveRecord::Migration
  def change
    create_table :event_feature_memberships do |t|
      t.belongs_to :event, null: false
      t.belongs_to :event_feature, null: false

      t.timestamps null: false
    end
  end
end
