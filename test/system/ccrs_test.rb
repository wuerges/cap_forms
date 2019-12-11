require "application_system_test_case"

class CcrsTest < ApplicationSystemTestCase
  setup do
    @ccr = ccrs(:one)
  end

  test "visiting the index" do
    visit ccrs_url
    assert_selector "h1", text: "Ccrs"
  end

  test "creating a Ccr" do
    visit ccrs_url
    click_on "New Ccr"

    fill_in "Name", with: @ccr.name
    click_on "Create Ccr"

    assert_text "Ccr was successfully created"
    click_on "Back"
  end

  test "updating a Ccr" do
    visit ccrs_url
    click_on "Edit", match: :first

    fill_in "Name", with: @ccr.name
    click_on "Update Ccr"

    assert_text "Ccr was successfully updated"
    click_on "Back"
  end

  test "destroying a Ccr" do
    visit ccrs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ccr was successfully destroyed"
  end
end
