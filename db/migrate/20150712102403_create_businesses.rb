class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.integer :neighborhood_id, null: false
      t.string :zip_code, null: false
      t.string :photo_url, null: false
      t.string :website_url
      t.string :facebook_url
      t.string :twitter_url
      t.string :yelp_url
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
