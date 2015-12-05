ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'capybara'
require 'minitest/pride'

DatabaseCleaner[:sequel, { :connection => Sequel.sqlite("db/robot_manager_test.sqlite3") }].strategy = :truncation

class Minitest::Test
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

Capybara.app = RobotManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
