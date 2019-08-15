require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/dish.rb'
require './lib/potluck.rb'

class PotluckTest < Minitest::Test
  #test it exits
  def test_potluck_exists
    potluck = Potluck.new("8-21-19")
    assert_instance_of Potluck, potluck
  end
  #test it has a date
  def test_potluck_has_a_date
    potluck = Potluck.new("8-21-19")
    assert_equal "8-21-19", potluck.date
  end
  #test it has a list of dishes
  def test_potluck_has_a_list_of_dishes
    potluck = Potluck.new("8-21-19")
    assert_equal [], potluck.dishes
  end
  #test it can add a dish
  #test it can add multiple dishes
end
