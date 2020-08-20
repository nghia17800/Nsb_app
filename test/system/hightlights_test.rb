require "application_system_test_case"

class HightlightsTest < ApplicationSystemTestCase
  setup do
    @hightlight = hightlights(:one)
  end

  test "visiting the index" do
    visit hightlights_url
    assert_selector "h1", text: "Hightlights"
  end

  test "creating a Hightlight" do
    visit hightlights_url
    click_on "New Hightlight"

    fill_in "Name", with: @hightlight.name
    fill_in "Video", with: @hightlight.video
    click_on "Create Hightlight"

    assert_text "Hightlight was successfully created"
    click_on "Back"
  end

  test "updating a Hightlight" do
    visit hightlights_url
    click_on "Edit", match: :first

    fill_in "Name", with: @hightlight.name
    fill_in "Video", with: @hightlight.video
    click_on "Update Hightlight"

    assert_text "Hightlight was successfully updated"
    click_on "Back"
  end

  test "destroying a Hightlight" do
    visit hightlights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hightlight was successfully destroyed"
  end
end
