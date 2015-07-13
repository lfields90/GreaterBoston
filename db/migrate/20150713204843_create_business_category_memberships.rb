class CreateBusinessCategoryMemberships < ActiveRecord::Migration
  def change
    create_table :business_category_memberships do |t|
      t.integer :business_id, null: false
      t.integer :business_category_id, null: false

      t.timestamps null: false
    end
  end
end
