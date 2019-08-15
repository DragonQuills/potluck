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
  def test_potluck_can_add_a_dish
    potluck = Potluck.new("8-21-19")
    bean_dip = Dish.new("Bean Dip", :appetizer)

    potluck.add_dish(bean_dip)

    assert_equal bean_dip, potluck.dishes[0]
  end

  #test it can add multiple dishes
  def test_potluck_can_add_multiple_dishes
    potluck = Potluck.new("8-21-19")
    bean_dip = Dish.new("Bean Dip", :appetizer)
    pulled_pork = Dish.new("Pulled Pork", :entre)

    potluck.add_dish(bean_dip)
    potluck.add_dish(pulled_pork)

    assert_equal bean_dip, potluck.dishes[0]
    assert_equal pulled_pork, potluck.dishes[1]
  end
end
