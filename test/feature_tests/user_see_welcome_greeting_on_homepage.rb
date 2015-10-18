require_relative '../test_helper'

class GreetingTest < FeatureTest

  def test_user_sees_greeting_on_homepage
    visit '/'

    assert_equal '/', current_path
    within("#greeting") do
      assert page.has_content?("Welcome to Robot World: A World of Robots")
    end
  end

end
