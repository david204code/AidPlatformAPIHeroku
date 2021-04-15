require 'test_helper'

class HelpsControllerTest < ActionDispatch::IntegrationTest

  test "should get all Help" do
    get '/helps'
    assert_response :success
  end

end
