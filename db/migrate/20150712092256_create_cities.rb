class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :state, null: false
      t.integer :user, null: false
      t.string :website_url

      t.timestamps null: false
    end
  end
end
