class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :relationships do |t|
      t.integer :following_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationships, %i[following_id followed_id], unique: true

    add_foreign_key :relationships, :users, column: :following_id
    add_foreign_key :relationships, :users, column: :followed_id
  end
end
