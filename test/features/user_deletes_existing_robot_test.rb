require_relative '../test_helper'

class UserDeletesRobotFromExistingTask < FeatureTest

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

  def test_deleted_robot_is_not_displayed
    create_robots(2)
    robot = RobotManager.all.first

    visit "/robots/#{robot.id}"
    click_button('Destroy Robot')
    assert_equal '/robots', current_path
    within ('.card') do
      refute page.has_content?("1")
    end
  end
end
