class CreateBusinessCategoryMemberships < ActiveRecord::Migration
  def change
    create_table :business_category_memberships do |t|
      t.belongs_to :business, null: false
      t.belongs_to :business_category, null: false

      t.timestamps null: false
    end
  end
end
