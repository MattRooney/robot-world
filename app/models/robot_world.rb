require 'yaml/store'

class RobotWorld
  def self.database
    if ENV["RACK_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/robot_world_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_world_development.sqlite3")
    end
  end

  def self.dataset
    database.from(:robots)
  end

  def self.create(robot)
    dataset.insert(robot)
  end

  def self.all
    robots = dataset.to_a
    robots.map { |data| Robot.new(data) }
  end

  def self.find(id)
    robot = dataset.where(:id=>id).to_a.first
    Robot.new(robot)
  end

  def self.update(id, data)
    robot = dataset.where(:id=>id)
    robot.update(data)
  end

  def self.delete(id)
    dataset.where(:id=>id).delete
  end

end
