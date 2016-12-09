class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.references :user, foreign_key: true, index: true
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps(null: false)
    end
  end
end
