class CreateBusinessFeatureMemberships < ActiveRecord::Migration
  def change
    create_table :business_feature_memberships do |t|
      t.belongs_to :business, null: false
      t.belongs_to :business_feature, null: false

      t.timestamps null: false
    end
  end
end
