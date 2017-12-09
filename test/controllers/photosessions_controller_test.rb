require 'test_helper'

class PhotosessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photosessions_index_url
    assert_response :success
  end

end
