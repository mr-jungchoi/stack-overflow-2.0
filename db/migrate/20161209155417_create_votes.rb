class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :voteable_id
      t.references :user, foreign_key: true, index: true
      t.string :voteable_type
      t.integer :vote_direction, default: 0

      t.timestamps(null: false)
    end
  end
end
