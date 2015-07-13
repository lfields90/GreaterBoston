class CreateEventFeatures < ActiveRecord::Migration
  def change
    create_table :event_features do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
