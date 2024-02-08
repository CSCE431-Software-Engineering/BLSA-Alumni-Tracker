class RenameProfilePictureToProfilePicture < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :Profile_picture, :Profile_Picture
  end
end
