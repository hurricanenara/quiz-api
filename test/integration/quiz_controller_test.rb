require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should be able to create a test" do 
    post quiz_path
    assert_not_nil JSON.parse(response.body)["first_question"]
    assert_not_nil JSON.parse(response.body)["total_questions"]
    assert_not_nil JSON.parse(response.body)["quiz_id"]
  end

  test "should be able to answer question" do
    post quiz_path
    
    quiz_id = JSON.parse(response.body)["quiz_id"]
    question_id = JSON.parse(response.body)["first_question"]["id"]
    post answer_path(quiz_id, question_id), params: { answer: "b"}

    assert_not_nil JSON.parse(response.body)["next_question"]
    assert_not_nil JSON.parse(response.body)["is_correct"]
  end
end