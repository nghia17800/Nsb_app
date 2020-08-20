require 'test_helper'

class HightlightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hightlight = hightlights(:one)
  end

  test "should get index" do
    get hightlights_url
    assert_response :success
  end

  test "should get new" do
    get new_hightlight_url
    assert_response :success
  end

  test "should create hightlight" do
    assert_difference('Hightlight.count') do
      post hightlights_url, params: { hightlight: { name: @hightlight.name, video: @hightlight.video } }
    end

    assert_redirected_to hightlight_url(Hightlight.last)
  end

  test "should show hightlight" do
    get hightlight_url(@hightlight)
    assert_response :success
  end

  test "should get edit" do
    get edit_hightlight_url(@hightlight)
    assert_response :success
  end

  test "should update hightlight" do
    patch hightlight_url(@hightlight), params: { hightlight: { name: @hightlight.name, video: @hightlight.video } }
    assert_redirected_to hightlight_url(@hightlight)
  end

  test "should destroy hightlight" do
    assert_difference('Hightlight.count', -1) do
      delete hightlight_url(@hightlight)
    end

    assert_redirected_to hightlights_url
  end
end
