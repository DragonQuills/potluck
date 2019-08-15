class Dish
  attr_reader :name, :category
  def initialize(dishName, dishCategory)
    @name = dishName
    @category = dishCategory
  end
end
