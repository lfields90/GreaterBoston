class CreateBusinessCategories < ActiveRecord::Migration
  def change
    create_table :business_categories do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
