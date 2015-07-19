class AddProfilePhotoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo, :string,
      default: "http://rampages.us/williamstw2/wp-content/uploads/sites/2505/2014/10/sprout.jpeg"
  end
end
