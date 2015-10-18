require_relative '../test_helper'

class NewTest < FeatureTest
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

  def test_user_can_add_a_robot
    create_robots(1)

    visit '/robots'
    click_link "Name 1"

    assert_equal "/robots/1", current_path
  end

  def test_user_can_see_and_use_new_robot_form
    visit '/'
    click_link "Make A New Robot!"

    assert_equal '/robots/new', current_path
    fill_in('Name:', :with => 'Juan')
    find_button('Submit').click

    assert_equal '/robots', current_path
  end

end
