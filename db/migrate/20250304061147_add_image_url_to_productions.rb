class AddImageUrlToProductions < ActiveRecord::Migration[7.2]
  def change
    add_column :productions, :image_url, :string
  end
end
