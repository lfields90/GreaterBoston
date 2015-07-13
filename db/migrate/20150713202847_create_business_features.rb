class CreateBusinessFeatures < ActiveRecord::Migration
  def change
    create_table :business_features do |t|
      t.integer :business_id
      t.integer :feature_id

      t.timestamps null: false
    end
  end
end
