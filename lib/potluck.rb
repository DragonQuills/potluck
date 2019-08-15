require './lib/dish.rb'

class Potluck
  attr_reader :date
  attr_reader :dishes
  def initialize(potluckDate)
    @date = potluckDate
    @dishes = []
  end
end
