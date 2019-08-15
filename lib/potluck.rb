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

  def menu
    menu = {}
    @dishes.each do |dish|
      menu_category = dish.category.to_s + "s" #add the s to the end
      menu_category = menu_category.to_sym

      new_dishes_list = [ menu[menu_category] ].flatten #get current dishes on the menu and make an array of them
      new_dishes_list.push(dish.name) #add the new dish
      new_dishes_list = new_dishes_list.compact #remove any nil entries
      new_dishes_list = new_dishes_list.sort #alphabetize
      menu[menu_category] = new_dishes_list
    end
    return menu
  end

  def ratio(category)
    total_dishes_in_category = 0
    @dishes.each do |dish|
      if dish.category == category
        total_dishes_in_category += 1
      end
    end
    ratio = (total_dishes_in_category.to_f / @dishes.length.to_f) * 100.0
  end

end
