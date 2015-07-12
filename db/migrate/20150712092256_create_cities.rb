class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :state, null: false
      t.string :user, null:false
      t.string :website_url

      t.timestamps null: false
    end
  end
end
