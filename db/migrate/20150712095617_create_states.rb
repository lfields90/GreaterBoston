class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :website_url
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
