class QuizList < ApplicationRecord
    # quizzes and questions
    # many quizzes point to quiz list
    # QuizQuestion
    belongs_to :quiz
    belongs_to :question
end
