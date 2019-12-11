require "application_system_test_case"

class FormSubmissionsTest < ApplicationSystemTestCase
  setup do
    @form_submission = form_submissions(:one)
  end

  test "visiting the index" do
    visit form_submissions_url
    assert_selector "h1", text: "Form Submissions"
  end

  test "creating a Form submission" do
    visit form_submissions_url
    click_on "New Form Submission"

    fill_in "Answer", with: @form_submission.answer_id
    fill_in "Form application", with: @form_submission.form_application_id
    fill_in "Offer", with: @form_submission.offer_id
    fill_in "Professor", with: @form_submission.professor_id
    fill_in "Question", with: @form_submission.question_id
    click_on "Create Form submission"

    assert_text "Form submission was successfully created"
    click_on "Back"
  end

  test "updating a Form submission" do
    visit form_submissions_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @form_submission.answer_id
    fill_in "Form application", with: @form_submission.form_application_id
    fill_in "Offer", with: @form_submission.offer_id
    fill_in "Professor", with: @form_submission.professor_id
    fill_in "Question", with: @form_submission.question_id
    click_on "Update Form submission"

    assert_text "Form submission was successfully updated"
    click_on "Back"
  end

  test "destroying a Form submission" do
    visit form_submissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Form submission was successfully destroyed"
  end
end
