require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
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

  def test_robot_is_created
    create_robots(1)
    robot = RobotWorld.find(1)

    assert_equal 1, robot.id
    assert_equal "Pedro", robot.name
    assert_equal "Juarez", robot.city
    assert_equal "MX", robot.state
    assert_equal "6/4/69", robot.birthday
    assert_equal "9/9/99", robot.hired
    assert_equal "sports", robot.department
  end

  def test_five_robots_are_created
    skip
    create_robots(5)

    assert_equal 5, RobotWorld.all.count
  end

  def test_three_robots_have_unique_names
    skip
    create_robots(3)

    assert_equal ["Name 1", "Name 2", "Name 3"], RobotWorld.all.map { |robot| robot.name }
  end

  def test_three_robots_have_unique_states
    skip
    create_robots(3)

    assert_equal ["State 1", "State 2", "State 3"], RobotWorld.all.map { |robot| robot.state }
  end

  def test_it_finds_by_id
    skip
    create_robots(5)
    robot_3 = RobotWorld.find(3)

    assert_equal 3, robot_3.id
    assert_equal "Name 3", robot_3.name
  end

  def test_robot_can_be_updated
    skip
    create_robots(1)
    RobotWorld.update(1, {:name => "Name 1",
                          :city => "City 1",
                          :state => "State 1",
                          :birthday => "B-day 1",
                          :hired => "FIRED",
                          :department => "department 1"})
    robot = RobotWorld.find(1)

    assert_equal "FIRED", robot.hired
  end

  def test_only_the_correct_robot_is_updated
    skip
    create_robots(10)
    RobotWorld.update(7, {:name => "Name 7",
                          :city => "City 7",
                          :state => "State 7",
                          :birthday => "B-day 7",
                          :hired => "hired 7",
                          :department => "deFartment"})
    robot_7 = RobotWorld.find(7)
    robot_8 = RobotWorld.find(8)

    assert_equal "deFartment", robot_7.department
    assert_equal "department 8", robot_8.department
  end

  def test_it_deletes
    skip
    create_robots(12)
    RobotWorld.delete(2)

    assert_equal 11, RobotWorld.all.count
  end

  def test_it_only_deletes_correct_robot
    skip
    create_robots(6)
    RobotWorld.delete(4)

    assert_equal ["City 1", "City 2", "City 3", "City 5", "City 6"],
      RobotWorld.all.map { |robot| robot.city }
  end
end
