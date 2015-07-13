class CreateBusinessFeatures < ActiveRecord::Migration
  def change
    create_table :business_features do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
