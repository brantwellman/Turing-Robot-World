require_relative '../test_helper'

class RobotManagerTest < Minitest::Test

  def create_robots(num)
    num.times do |n|
      RobotManager.create({ :name => "a name#{n+1}",
                            :city => "a city#{n+1}",
                            :state => "a state#{n+1}",
                            :birthdate => "a birthdate#{n+1}",
                            :date_hired => "a date_hired#{n+1}",
                            :department => "a department#{n+1}"
                            })
    end
  end

  def test_robot_can_be_created
    create_robots(1)

    robot = RobotManager.find(RobotManager.all.first.id)

    assert_equal "a name1", robot.name
    assert_equal "a city1", robot.city
    assert_equal "a state1", robot.state
    assert_equal RobotManager.all.first.id, robot.id
  end

  def test_it_can_find_all_robots
    create_robots(3)

    robots = RobotManager.all
    robot1 = robots[0]
    robot2 = robots[1]
    robot3 = robots[2]

    assert_equal 3, robots.count
    assert_equal "a name1", robot1.name
    assert_equal "a name2", robot2.name
    assert_equal "a name3", robot3.name
  end

  def test_it_finds_an_existing_robot
    create_robots(3)

    robot1 = RobotManager.find(RobotManager.all.first.id)
    robot2 = RobotManager.find(RobotManager.all.last.id)

    assert_equal "a name1", robot1.name
    assert_equal "a name3", robot2.name
  end

  def test_it_updates_an_existing_robot_and_doesnt_modify_others
    create_robots(2)

    RobotManager.update(RobotManager.all.first.id,
                           {
                              :name => "name",
                              :city => "city",
                              :state => "state",
                              :birthdate => "birthdate",
                              :date_hired => "a date_hired",
                              :department => "a department"
                              })

    robot1 = RobotManager.find(RobotManager.all.first.id)
    robot2 = RobotManager.find(RobotManager.all.last.id)

    assert_equal "name", robot1.name
    assert_equal "a name2", robot2.name
  end

  def test_it_destroys_an_existing_robot_wo_destroying_other_robots
    create_robots(3)

    robots1 = RobotManager.all
    RobotManager.delete(RobotManager.all.first.id)
    robots2 = RobotManager.all
    robot2 = RobotManager.find(RobotManager.all.first.id)
    robot3 = RobotManager.find(RobotManager.all.last.id)

    assert_equal 3, robots1.count
    assert_equal 2, robots2.count
    assert_equal "a name2", robot2.name
    assert_equal "a name3", robot3.name
    assert robots2.none? { |robot| robot.name == "a name1" }
  end

end
