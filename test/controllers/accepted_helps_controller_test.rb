require 'test_helper'

class AcceptedHelpsControllerTest < ActionDispatch::IntegrationTest

  test "should get all AcceptedHelps" do
    get '/accepted_helps'
    assert_response :success
  end
  
end
