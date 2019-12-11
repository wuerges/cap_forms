require "application_system_test_case"

class FormApplicationsTest < ApplicationSystemTestCase
  setup do
    @form_application = form_applications(:one)
  end

  test "visiting the index" do
    visit form_applications_url
    assert_selector "h1", text: "Form Applications"
  end

  test "creating a Form application" do
    visit form_applications_url
    click_on "New Form Application"

    fill_in "Form template", with: @form_application.form_template_id
    fill_in "Semester", with: @form_application.semester_id
    click_on "Create Form application"

    assert_text "Form application was successfully created"
    click_on "Back"
  end

  test "updating a Form application" do
    visit form_applications_url
    click_on "Edit", match: :first

    fill_in "Form template", with: @form_application.form_template_id
    fill_in "Semester", with: @form_application.semester_id
    click_on "Update Form application"

    assert_text "Form application was successfully updated"
    click_on "Back"
  end

  test "destroying a Form application" do
    visit form_applications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Form application was successfully destroyed"
  end
end
