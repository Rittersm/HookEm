class AddFromEmailToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :from_email, :string
  end
end
