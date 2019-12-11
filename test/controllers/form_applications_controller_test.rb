require 'test_helper'

class FormApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @form_application = form_applications(:one)
  end

  test "should get index" do
    get form_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_form_application_url
    assert_response :success
  end

  test "should create form_application" do
    assert_difference('FormApplication.count') do
      post form_applications_url, params: { form_application: { form_template_id: @form_application.form_template_id, semester_id: @form_application.semester_id } }
    end

    assert_redirected_to form_application_url(FormApplication.last)
  end

  test "should show form_application" do
    get form_application_url(@form_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_form_application_url(@form_application)
    assert_response :success
  end

  test "should update form_application" do
    patch form_application_url(@form_application), params: { form_application: { form_template_id: @form_application.form_template_id, semester_id: @form_application.semester_id } }
    assert_redirected_to form_application_url(@form_application)
  end

  test "should destroy form_application" do
    assert_difference('FormApplication.count', -1) do
      delete form_application_url(@form_application)
    end

    assert_redirected_to form_applications_url
  end
end
