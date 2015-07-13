class CreateBusinessFeatureMemberships < ActiveRecord::Migration
  def change
    create_table :business_feature_memberships do |t|
      t.integer :business_id, null: false
      t.integer :business_feature_id, null: false

      t.timestamps null: false
    end
  end
end
