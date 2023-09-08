require "test_helper"

class NumericalQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @numerical_question = numerical_questions(:one)
  end

  test "should get index" do
    get numerical_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_numerical_question_url
    assert_response :success
  end

  test "should create numerical_question" do
    assert_difference("NumericalQuestion.count") do
      post numerical_questions_url, params: { numerical_question: {  } }
    end

    assert_redirected_to numerical_question_url(NumericalQuestion.last)
  end

  test "should show numerical_question" do
    get numerical_question_url(@numerical_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_numerical_question_url(@numerical_question)
    assert_response :success
  end

  test "should update numerical_question" do
    patch numerical_question_url(@numerical_question), params: { numerical_question: {  } }
    assert_redirected_to numerical_question_url(@numerical_question)
  end

  test "should destroy numerical_question" do
    assert_difference("NumericalQuestion.count", -1) do
      delete numerical_question_url(@numerical_question)
    end

    assert_redirected_to numerical_questions_url
  end
end
