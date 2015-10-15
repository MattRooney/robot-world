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

    def test_five_robots_are_created
      create_robots(5)

      assert_equal 5, RobotWorld.all.count
    end

    def test_three_robots_have_unique_names
      create_robots(3)

      assert_equal ["Name 1", "Name 2", "Name 3"], RobotWorld.all.map { |robot| robot.name }
    end

    def test_three_robots_have_unique_states
      create_robots(3)

      assert_equal ["State 1", "State 2", "State 3"], RobotWorld.all.map { |robot| robot.state }
    end

    def test_it_finds_by_id
      create_robots(5)
      robot_3 = RobotWorld.find(3)

      assert_equal 3, robot_3.id
      assert_equal "Name 3", robot_3.name
    end

end
