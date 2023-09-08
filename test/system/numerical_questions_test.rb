require "application_system_test_case"

class NumericalQuestionsTest < ApplicationSystemTestCase
  setup do
    @numerical_question = numerical_questions(:one)
  end

  test "visiting the index" do
    visit numerical_questions_url
    assert_selector "h1", text: "Numerical questions"
  end

  test "should create numerical question" do
    visit numerical_questions_url
    click_on "New numerical question"

    click_on "Create Numerical question"

    assert_text "Numerical question was successfully created"
    click_on "Back"
  end

  test "should update Numerical question" do
    visit numerical_question_url(@numerical_question)
    click_on "Edit this numerical question", match: :first

    click_on "Update Numerical question"

    assert_text "Numerical question was successfully updated"
    click_on "Back"
  end

  test "should destroy Numerical question" do
    visit numerical_question_url(@numerical_question)
    click_on "Destroy this numerical question", match: :first

    assert_text "Numerical question was successfully destroyed"
  end
end
