class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.references :question, null:false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps(null:false)
    end
  end
end
