require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest

  test "should get all Conversations" do
    get '/conversations'
    assert_response :success
  end
  
end
