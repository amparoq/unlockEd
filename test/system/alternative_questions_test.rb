require "application_system_test_case"

class AlternativeQuestionsTest < ApplicationSystemTestCase
  setup do
    @alternative_question = alternative_questions(:one)
  end

  test "visiting the index" do
    visit alternative_questions_url
    assert_selector "h1", text: "Alternative questions"
  end

  test "should create alternative question" do
    visit alternative_questions_url
    click_on "New alternative question"

    click_on "Create Alternative question"

    assert_text "Alternative question was successfully created"
    click_on "Back"
  end

  test "should update Alternative question" do
    visit alternative_question_url(@alternative_question)
    click_on "Edit this alternative question", match: :first

    click_on "Update Alternative question"

    assert_text "Alternative question was successfully updated"
    click_on "Back"
  end

  test "should destroy Alternative question" do
    visit alternative_question_url(@alternative_question)
    click_on "Destroy this alternative question", match: :first

    assert_text "Alternative question was successfully destroyed"
  end
end
