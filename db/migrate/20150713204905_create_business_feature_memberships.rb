class CreateBusinessFeatureMemberships < ActiveRecord::Migration
  def change
    create_table :business_feature_memberships do |t|
      t.integer :business_id
      t.integer :business_feature_id

      t.timestamps null: false
    end
  end
end
