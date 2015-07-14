class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.belongs_to :city, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
