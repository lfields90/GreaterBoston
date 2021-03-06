class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :website_url
      t.belongs_to :city, null: false

      t.timestamps null: false
    end
  end
end
