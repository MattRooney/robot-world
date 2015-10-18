require_relative '../test_helper'

class IndexTest < FeatureTest
  def create_robots(num)
    num.times do |id|
      id += 1
      RobotWorld.create ({:name => "Name #{id}",
                          :city => "City #{id}",
                          :state => "State #{id}",
                          :birthday => "B-day #{id}",
                          :hired => "hired #{id}",
                          :department => "department #{id}"})
    end
  end

  def test_user_can_edit_a_robot
    create_robots(1)

    visit'/robots'
    click_link "Edit"

    assert_equal '/robots/1/edit', current_path
  end

  # Test show.erb view
  def test_user_can_see_a_specific_robot
    create_robots(3)

    visit'/robots'
    click_link "Name 3"

    assert_equal '/robots/3', current_path
  end

  def test_index_can_hold_six_robots
    create_robots(6)

    visit'/robots'
    click_link "Name 6"

    assert_equal '/robots/6', current_path
    click_link "Back to Robot Index"

    assert_equal '/robots', current_path
  end
end
