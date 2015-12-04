require_relative '../test_helper'

class UserEditsRobotFromExistingRobot < FeatureTest

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

  def test_new_edited_robot_is_displayed
    create_robots(1)

    visit '/robots/1/edit'
    fill_in('robot[name]', with: "Brant")
    fill_in('robot[city]', with: 'Denver')
    select('Colorado', from: 'robot[state]')
    select('Education', from: "robot[department]")
    click_button('submit')
    assert_equal '/robots/1', current_path

    within ('.card') do
      assert page.has_content?("Brant")
      assert page.has_content?('Denver')
      assert page.has_content?("CO")
      assert page.has_content?("Education")
    end
  end

end
