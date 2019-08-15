require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/dish.rb'

class DishTest < Minitest::Test
  def test_dish_exists
    dish = Dish.new("Pulled pork", :entre)
    assert_instance_of Dish, dish
  end

  def test_dish_has_a_name
    dish = Dish.new("Pulled pork", :entre)
    assert_equal "Pulled pork", dish.name
  end

  def test_it_has_a_category
    dish = Dish.new("Pulled pork", :entre)
    assert_equal :entre, dish.category
  end
end
