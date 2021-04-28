class QuizLists < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_lists do |t|
      t.integer "quiz_id"
      t.integer "question_id"
      t.string "answer"
      t.boolean "correct"
      
      t.index ["quiz_id", "question_id"], unique: true

      t.timestamps
    end
  end
end
