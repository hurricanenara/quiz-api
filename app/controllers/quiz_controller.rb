class QuizController < ApplicationController
  def create
    questions = Question.all.sample(10) # This will return a sample of the questions from the seed
    quiz = Quiz.create

    questions.each do |question|
      QuizList.create(
        quiz_id: quiz.id,
        question_id: question.id
      )
    end
    # Finish code here, associate questions to quiz.
    @first_question = questions.first
    render json: { message: 'Quiz created', first_question: { question: @first_question.question, id: @first_question.id, answers: @first_question.answers },
                   total_questions: questions.length, quiz_id: quiz.id }, status: 200
  end

  def verify
    user_answer = params[:answer]
    # find by
    quiz = Quiz.where(id: params[:quiz_id]).first
    correct_answer = Question.where(id: params[:question_id]).first.correct_answer
    correct = user_answer == correct_answer
    question = QuizList.where(quiz_id: quiz.id, question_id: params[:question_id])
    question.update(correct: correct, answer: user_answer)
    next_question = quiz.questions.where("quiz_lists.answer IS NULL").first
    if next_question
      render json: { message: 'Recorded Answer', is_correct: correct, next_question: { question: next_question.question , id: next_question.id, answers: next_question.answers } }
    else
      render json: { message: 'end'}
    end
  end

  def claim
    quiz = Quiz.where(id: params[:quiz_id]).first
    not_found && return if quiz.blank? || !quiz.name.blank?

    quiz.name = params[:name]
    quiz.save

    render json: { message: 'Quiz Claimed', quiz_id: quiz.id }.to_json, status: 200
  end
end
