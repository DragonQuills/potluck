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

  def test_potluck_dishes_list_length_is_correct
    potluck = Potluck.new("8-21-19")

    bean_dip = Dish.new("Bean Dip", :appetizer)
    pulled_pork = Dish.new("Pulled Pork", :entre)

    potluck.add_dish(bean_dip)
    potluck.add_dish(pulled_pork)

    assert_equal 2, potluck.dishes.length
  end

  def test_get_all_from_category_returns_list
    potluck = Potluck.new("8-21-19")

    bean_dip = Dish.new("Bean Dip", :appetizer)
    mushroom_salad = Dish.new("Mushroom Salad", :appetizer)
    pulled_pork = Dish.new("Pulled Pork", :entre)

    potluck.add_dish(bean_dip)
    potluck.add_dish(mushroom_salad)
    potluck.add_dish(pulled_pork)

    assert_equal [bean_dip, mushroom_salad], potluck.get_all_from_category(:appetizer)
    assert_equal bean_dip,  potluck.get_all_from_category(:appetizer).first
    assert_equal "Bean Dip", potluck.get_all_from_category(:appetizer).first.name
  end

  def test_potluck_menu_works
    potluck = Potluck.new("8-21-19")

    mushroom_salad = Dish.new("Mushroom Salad", :appetizer)
    bean_dip = Dish.new("Bean Dip", :appetizer)
    pulled_pork = Dish.new("Pulled Pork", :entre)
    lemon_cake = Dish.new("Lemon Cake", :dessert)
    tuna_sandwiches = Dish.new("Tuna Salad Sandwiches", :entre)

    potluck.add_dish(mushroom_salad)
    potluck.add_dish(bean_dip)
    potluck.add_dish(pulled_pork)
    potluck.add_dish(lemon_cake)
    potluck.add_dish(tuna_sandwiches)

    expected_menu = {:appetizers: ["Bean Dip", "Mushroom Salad"], :entres: ["Pulled Pork", "Tuna Salad Sandwiches"], :desserts:["Lemon Cake"]}
    assert_equal expected_menu, potluck.menu
  end

end
