class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :body, null: false, default: '', limit: 140
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
