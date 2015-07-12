class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :city, null: false
      t.integer :state, null: false
      t.integer :user, null: false

      t.timestamps null: false
    end
  end
end
