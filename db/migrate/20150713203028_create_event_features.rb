class CreateEventFeatures < ActiveRecord::Migration
  def change
    create_table :event_features do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
