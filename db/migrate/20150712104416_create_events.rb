class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.datetime :date, null: false
      t.string :address, null: false
      t.string :photo_url, null: false
      t.string :facebook_url
      t.string :twitter_url

      t.boolean :featured, default: false
      t.belongs_to :user, null: false
      t.belongs_to :neighborhood, null: false
      t.belongs_to :category, null: false

      t.timestamps null: false
    end
  end
end
