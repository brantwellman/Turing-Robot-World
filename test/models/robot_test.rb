require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({ :name        => "a name",
                        :city        => "a city",
                        :state       => "a state",
                        :birthdate   => "7777",
                        :date_hired  => "8888",
                        :department  => "a department",
                        :id          => 1 })

    assert_equal "a name", robot.name
    assert_equal "a city", robot.city
    assert_equal "a state", robot.state
    assert_equal "7777", robot.birthdate
    assert_equal "8888", robot.date_hired
    assert_equal "a department", robot.department
    assert_equal 1, robot.id
  end
end
