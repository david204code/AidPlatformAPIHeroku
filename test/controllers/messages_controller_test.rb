require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

  test "should get all messages" do
    get '/messages'
    assert_response :success
  end

end
