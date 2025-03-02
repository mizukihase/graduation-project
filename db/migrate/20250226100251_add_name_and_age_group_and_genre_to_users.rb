class AddNameAndAgeGroupAndGenreToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string
    add_column :users, :age_group, :integer
    add_column :users, :genre, :string
  end
end
