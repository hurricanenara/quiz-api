class CreateQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
    	t.string "question"
    	t.json "answers"
    	t.string "correct_answer"
    	t.timestamps
    end
  end
end
