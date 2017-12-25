require 'test_helper'

class PhotoSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_session = photo_sessions(:one)
  end

  test "should get index" do
    get photo_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_session_url
    assert_response :success
  end

  test "should create photo_session" do
    assert_difference('PhotoSession.count') do
      post photo_sessions_url, params: { photo_session: {  } }
    end

    assert_redirected_to photo_session_url(PhotoSession.last)
  end

  test "should show photo_session" do
    get photo_session_url(@photo_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_photo_session_url(@photo_session)
    assert_response :success
  end

  test "should update photo_session" do
    patch photo_session_url(@photo_session), params: { photo_session: {  } }
    assert_redirected_to photo_session_url(@photo_session)
  end

  test "should destroy photo_session" do
    assert_difference('PhotoSession.count', -1) do
      delete photo_session_url(@photo_session)
    end

    assert_redirected_to photo_sessions_url
  end
end
