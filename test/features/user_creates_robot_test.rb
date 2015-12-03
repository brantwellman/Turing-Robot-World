require_relative '../test_helper'

class UserCreatesRobotFromNewForm < FeatureTest

  def test_robot_is_created_from_new_form
    visit '/robots/new'
    fill_in('robot[name]', with: "Brant")
    fill_in('robot[city]', with: 'Denver')
    # fill_in('robot[state]', with: 'Colorado')
    fill_in('robot[birthdate]', with: '7777')
    fill_in('robot[date_hired]', with: '8888')
    # fill_in('robot[department]', with: 'education')
    click_button('submit')
    visit '/robots'

    within ('.card') do
      assert page.has_content?("Brant")
      assert page.has_content?("Denver")
      assert page.has_content?("Colorado")
      assert page.has_content?('7777')
      assert page.has_content?('8888')
      assert page.has_content?('education')
    end
  end
end
