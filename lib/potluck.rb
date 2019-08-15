require './lib/dish.rb'

class Potluck
  attr_reader :date
  attr_reader :dishes

  def initialize(potluckDate)
    @date = potluckDate
    @dishes = []
  end

  def add_dish(dish)
    @dishes.push(dish)
  end

  def get_all_from_category(given_category)
    matching_dishes = []
    @dishes.each do |dish|
      if dish.category == given_category
        matching_dishes.push(dish)
      end
    end
    
    return matching_dishes
  end

end
