require './lib/dish.rb'

class Potluck
  attr_reader :date
  def initialize(potluckDate)
    @date = potluckDate
  end
end
