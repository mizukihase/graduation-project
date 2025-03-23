class CreateUserProductions < ActiveRecord::Migration[7.2]
  def change
    create_table :user_productions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :production, null: false, foreign_key: true

      t.timestamps
    end
  end
end
