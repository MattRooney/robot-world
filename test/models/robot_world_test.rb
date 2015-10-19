require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  def create_robots(num)
    num.times do |id|
      RobotWorld.create ({:name => "Name #{id+1}",
                          :city => "City #{id+1}",
                          :state => "State #{id+1}",
                          :birthday => "B-day #{id+1}",
                          :hired => "Hired #{id+1}",
                          :department => "Department #{id+1}"})
    end
  end

  def test_robot_is_created
    create_robots(1)
    robot = RobotWorld.find(RobotWorld.all.first.id)

    assert_equal RobotWorld.all.first.id, robot.id
    assert_equal "Name 1", robot.name
    assert_equal "City 1", robot.city
    assert_equal "State 1", robot.state
    assert_equal "B-day 1", robot.birthday
    assert_equal "Hired 1", robot.hired
    assert_equal "Department 1", robot.department
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
    robot = RobotWorld.find(RobotWorld.all.first.id)

    assert_equal RobotWorld.all.first.id, robot.id
    assert_equal "Name 1", robot.name
    assert_equal "Hired 1", robot.hired
  end

  def test_robot_can_be_updated
    create_robots(1)
    RobotWorld.update(RobotWorld.all.first.id, {:name => "Name 1",
                                                :city => "City 1",
                                                :state => "State 1",
                                                :birthday => "B-day 1",
                                                :hired => "FIRED",
                                                :department => "Department 1"})
    robot = RobotWorld.find(RobotWorld.all.first.id)

    assert_equal "B-day 1", robot.birthday
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
                          :department => "baseball"})
    robot_7 = RobotWorld.find()
    robot_8 = RobotWorld.find()

    assert_equal "baseball", robot_7.department
    assert_equal "department 8", robot_8.department
  end

  def test_it_deletes
    create_robots(12)
    RobotWorld.delete(RobotWorld.all.first.id)

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
