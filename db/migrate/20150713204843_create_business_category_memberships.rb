class CreateBusinessCategoryMemberships < ActiveRecord::Migration
  def change
    create_table :business_category_memberships do |t|
      t.integer :business_id
      t.integer :business_category_id

      t.timestamps null: false
    end
  end
end
