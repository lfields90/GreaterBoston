class CreateEventCategories < ActiveRecord::Migration
  def change
    create_table :event_categories do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
