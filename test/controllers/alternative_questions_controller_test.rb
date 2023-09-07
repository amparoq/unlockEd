require "test_helper"

class AlternativeQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alternative_question = alternative_questions(:one)
  end

  test "should get index" do
    get alternative_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_alternative_question_url
    assert_response :success
  end

  test "should create alternative_question" do
    assert_difference("AlternativeQuestion.count") do
      post alternative_questions_url, params: { alternative_question: {  } }
    end

    assert_redirected_to alternative_question_url(AlternativeQuestion.last)
  end

  test "should show alternative_question" do
    get alternative_question_url(@alternative_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_alternative_question_url(@alternative_question)
    assert_response :success
  end

  test "should update alternative_question" do
    patch alternative_question_url(@alternative_question), params: { alternative_question: {  } }
    assert_redirected_to alternative_question_url(@alternative_question)
  end

  test "should destroy alternative_question" do
    assert_difference("AlternativeQuestion.count", -1) do
      delete alternative_question_url(@alternative_question)
    end

    assert_redirected_to alternative_questions_url
  end
end
