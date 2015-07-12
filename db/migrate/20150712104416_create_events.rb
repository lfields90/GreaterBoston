class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :address, null: false
      t.integer :phone, null: false
      t.integer :neighborhood, null: false
      t.string :zip_code, null: false
      t.string :photo_url, null: false
      t.integer :city, null: false
      t.integer :state, null: false
      t.integer :user, null: false
      t.string :website_url
      t.string :facebook_url
      t.string :twitter_url
      t.string :meet-up_url
      t.string :event-brite_url

      t.timestamps null: false
    end
  end
end
