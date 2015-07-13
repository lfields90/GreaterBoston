class CreateBusinessCategories < ActiveRecord::Migration
  def change
    create_table :business_categories do |t|
      t.integer :business_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
