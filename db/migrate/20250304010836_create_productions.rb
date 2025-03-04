class CreateProductions < ActiveRecord::Migration[7.2]
  def change
    create_table :productions do |t|
      t.string :title
      t.string :author
      t.string :category
      t.string :external_id, null: false

      t.timestamps
    end
    add_index :productions, :external_id, unique: true
  end
end
