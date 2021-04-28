class CreateQuiz < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
    	t.timestamps
    	t.string "name"
    end
  end
end
