require_relative '../test_helper'

class UserCreatesRobotFromNewForm < FeatureTest

  def test_robot_is_created_from_new_form
    visit '/robots/new'
    fill_in('robot[name]', with: "Brant")
    fill_in('robot[city]', with: 'Denver')
    select('Colorado', from: 'robot[state]')
    select('Education', from: "robot[department]")
    click_button('submit')

    visit '/robots'

    within ('.card') do
      assert page.has_content?("Brant")
      assert page.has_content?("Denver")
      assert page.has_content?("CO")
      assert page.has_content?('Education')
    end
  end
end
