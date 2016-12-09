class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.references :user, foreign_key: true, index: true
      t.integer :best_answer_id

      t.timestamps(null: false)
    end
  end
end
