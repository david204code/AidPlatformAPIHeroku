require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get user index" do
    get '/users'
    assert_response :success
  end

end
