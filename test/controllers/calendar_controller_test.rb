require 'test_helper'

class CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get calendar_test_url
    assert_response :success
  end

end
