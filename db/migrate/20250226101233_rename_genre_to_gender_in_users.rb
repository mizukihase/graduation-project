class RenameGenreToGenderInUsers < ActiveRecord::Migration[7.2]
  def change
    rename_column :users, :genre, :gender
  end
end
