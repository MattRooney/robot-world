require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  def test_robot_is_created
    RobotWorld.create({ :name => "Pedro",
                        :city => "Juarez",
                        :state => "MX",
                        :birthday => "6/4/69",
                        :hired => "9/9/99",
                        :department => "sports"})
    robot = RobotWorld.find(1)

    assert_equal 1, robot.id
    assert_equal "Pedro", robot.name
    assert_equal "Juarez", robot.city
    assert_equal "MX", robot.state
    assert_equal "6/4/69", robot.birthday
    assert_equal "9/9/99", robot.hired
    assert_equal "sports", robot.department
  end

  def create_robots(num)
    num.times do |i|
      i = 1
      RobotWorld.create ({ :name => "Name #{i}",
                          :city => "City #{i}",
                          :state => "State #{i}",
                          :birthday => "B-day #{i}",
                          :hired => "hired #{i}",
                          :department => "department #{i}"})
      i += 1
      end
    end

    def test_two_robots_are_created
      create_robots(2)

      assert_equal 2, RobotWorld.all.count
    end

end
