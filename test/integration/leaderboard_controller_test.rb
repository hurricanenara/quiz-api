require 'test_helper'

class LeaderboardControllerTest < ActionDispatch::IntegrationTest
  test 'should be able to test a leaderboard' do
    post quiz_path
    
    quiz_id = JSON.parse(response.body)["quiz_id"]
    question_id = JSON.parse(response.body)["first_question"]["id"]
    post answer_path(quiz_id, question_id), params: { answer: "b"}

    post claim_path(quiz_id, params: {name: "hello"})
    get leaderboard_path
    assert_not_nil JSON.parse(response.body)["leaderboard"]
    assert_not_nil JSON.parse(response.body)["leaderboard"][0]["name"]
    assert_not_nil JSON.parse(response.body)["leaderboard"][0]["score"]

  end
end
