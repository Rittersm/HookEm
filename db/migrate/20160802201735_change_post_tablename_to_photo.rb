class ChangePostTablenameToPhoto < ActiveRecord::Migration[5.0]
  def change
    rename_table :posts, :photos
  end
end
