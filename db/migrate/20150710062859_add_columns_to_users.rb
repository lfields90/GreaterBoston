class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, null: false
    add_index :users, :provider
    add_column :users, :uid, :string, null: false
    add_index :users, :uid
    add_column :users, :name, :string, null: false
    add_column :users, :location, :string
    add_column :users, :image_url, :string
    add_column :users, :url, :string
    add_index :users, [:provider, :uid], unique: true
  end
end
