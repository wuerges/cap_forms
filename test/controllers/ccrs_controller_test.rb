require 'test_helper'

class CcrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ccr = ccrs(:one)
  end

  test "should get index" do
    get ccrs_url
    assert_response :success
  end

  test "should get new" do
    get new_ccr_url
    assert_response :success
  end

  test "should create ccr" do
    assert_difference('Ccr.count') do
      post ccrs_url, params: { ccr: { name: @ccr.name } }
    end

    assert_redirected_to ccr_url(Ccr.last)
  end

  test "should show ccr" do
    get ccr_url(@ccr)
    assert_response :success
  end

  test "should get edit" do
    get edit_ccr_url(@ccr)
    assert_response :success
  end

  test "should update ccr" do
    patch ccr_url(@ccr), params: { ccr: { name: @ccr.name } }
    assert_redirected_to ccr_url(@ccr)
  end

  test "should destroy ccr" do
    assert_difference('Ccr.count', -1) do
      delete ccr_url(@ccr)
    end

    assert_redirected_to ccrs_url
  end
end
