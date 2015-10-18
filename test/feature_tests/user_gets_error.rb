require_relative '../test_helper'

class ErrorTest < FeatureTest
  def test_user_sees_an_error_message_for_a_bad_route
    visit '/bad'

    assert_equal '/bad', current_path
    assert page.has_content?("An Error Occured")
  end
end
