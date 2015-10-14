require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_it_assigns_attributes_to_robots
    robot = Robot.new({ "name"  => "robot's name",
                        "city"  => "robot's home city",
                        "state" => "robot's home state",
                        "birthday" => "robot's birthday",
                        "hired" => "robot's date of hire",
                        "department" => "robot's department",
                        "id" => 1
      })

    assert_equal 1, robot.id
    assert_equal "robot's name", robot.name
    assert_equal "robot's home city", robot.city
    assert_equal "robot's home state", robot.state
    assert_equal "robot's birthday", robot.birthday
    assert_equal "robot's date of hire", robot.hired
    assert_equal "robot's department", robot.department
  end
end
